//import 'package:animate_do/animate_do.dart';
import 'package:curso_disenios/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:curso_disenios/src/widgets/headers.dart';
import 'package:curso_disenios/src/widgets/card_button.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemBoton {

  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Function onPress;

  ItemBoton( this.icon, this.title, this.primaryColor, this.secondaryColor, this.onPress );
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.images, 'Slideshow', Color(0xff6989F5), Color(0xff906EF5), (){ Navigator.pushNamed(context, 'slideshow'); } ),
      new ItemBoton( FontAwesomeIcons.pinterestP, 'Pinterest page', Color(0xff66A9F2), Color(0xff536CF6), (){ Navigator.pushNamed(context, 'pinterest'); } ),
      new ItemBoton( FontAwesomeIcons.levelUpAlt, 'Sticky header', Color(0xffF2D572), Color(0xffE06AA3), (){ Navigator.pushNamed(context, 'sliver'); }),
      new ItemBoton( FontAwesomeIcons.play, 'Animations', Color(0xff317183), Color(0xff46997D), (){ Navigator.pushNamed(context, 'animationDo'); } ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Example Lorem', Color(0xff6989F5), Color(0xff906EF5), (){} ),
      new ItemBoton( FontAwesomeIcons.plus, 'Example Lorem', Color(0xff66A9F2), Color(0xff536CF6), (){} ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Example Lorem', Color(0xffF2D572), Color(0xffE06AA3), (){} ),
      new ItemBoton( FontAwesomeIcons.biking, 'Example Lorem', Color(0xff317183), Color(0xff46997D), (){} ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Example Lorem', Color(0xff6989F5), Color(0xff906EF5), (){} ),
      new ItemBoton( FontAwesomeIcons.plus, 'Example Lorem', Color(0xff66A9F2), Color(0xff536CF6), (){} ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Example Lorem', Color(0xffF2D572), Color(0xffE06AA3), (){} ),
      new ItemBoton( FontAwesomeIcons.biking, 'Example Lorem', Color(0xff317183), Color(0xff46997D), (){})
    ];

    final List<Widget> itemMap = items.map(
      (item) => CardButton(
        icon: item.icon,
        title: item.title,
        primaryColor: item.primaryColor,
        secondaryColor: item.secondaryColor,
        onPress: item.onPress
      )
    ).toList();

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: false,
            delegate: _SliverCustomHeaderDelegate(
              minHeight: 125, 
              maxHeight: 270, 
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: _PageHeader(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 0)
                    )
                  ]
                ),
              )
            )
          ),

          SliverList(
            delegate: SliverChildListDelegate(itemMap)
          )
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight, 
    @required this.maxHeight, 
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child != oldDelegate.child;
  }
}

class _PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Haz solicitado',
          subtitle: 'Asistencia Médica',
          primaryColor: Colors.blueAccent,
          secondaryColor: Colors.blue,
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)
          ),
        )
      ],
    );
  }
}
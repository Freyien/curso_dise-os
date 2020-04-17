import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:curso_disenios/src/widgets/pinterest_menu.dart';
import 'package:curso_disenios/src/widgets/appbar.dart';
import 'package:curso_disenios/src/theme/theme.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: simpleAppbar(title: 'Pinterest Menu', backgroundColor: currentTheme.accentColor),
          body: Stack(
            children: <Widget>[
              _PinterestGrid(),
              _PinterestMenuLocation()
            ],
          )
        ),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double beforeScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      //print('Scroll listener: ${controller.offset}');
      if ( controller.offset > beforeScroll && controller.offset > 100 ) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

    beforeScroll = controller.offset;
    });
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: new StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        controller: controller,
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    final number = (this.index % 5) + 1;
    return new Container(
      //margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        //color: Colors.blue,
        border: Border.all(
          width: 1,
          color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: new Center(
        child: SvgPicture.asset('assets/svg/slide-$number.svg')
      )
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
      child: PinterestMenu(
        show: show,
        items: [
          PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart'); }),
          PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search'); }),
          PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications'); }),
          PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); })
        ],
        primaryColor: currentTheme.accentColor,
        secondaryColor: Colors.grey,
        backgroundColor: currentTheme.cardColor,
      ),
      bottom: 30,
      left: MediaQuery.of(context).size.width * 0.2
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;
  set show( bool show ) {
    this._show = show;
    notifyListeners();
  }
}
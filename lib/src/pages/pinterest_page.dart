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
    int count = 2;

    if ( MediaQuery.of(context).size.width > 500 )
      count = 3;

    return Container(
      padding: EdgeInsets.all(10),
      child: new StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        controller: controller,
        crossAxisCount: count,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(1, index.isEven ? 1 : 2),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
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
    final appTheme = Provider.of<ThemeChanger>(context);
    final sufix = (appTheme.darkTheme) ? 'p' : 'b';

    return new Container(
      //margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        //color: Colors.blue,
        border: Border.all(
          width: 1,
          color: Colors.blueGrey
        ),
        borderRadius: BorderRadius.circular(10),
        color: appTheme.currentTheme.backgroundColor.withOpacity(.5)
      ),
      child: new Center(
        child: SvgPicture.asset('assets/svg/slide-$number-$sufix.svg')
      )
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final show = Provider.of<_MenuModel>(context).show;

    if (sizeWidth > 750)
      sizeWidth = sizeWidth - 300;

    return Positioned(
      child: Container(
        width: sizeWidth,
        child: Row(
          children:<Widget>[
            Spacer(),
            PinterestMenu(
              show: show,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart'); }),
                PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search'); }),
                PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications'); }),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); })
              ],
              primaryColor: currentTheme.accentColor,
              secondaryColor: Colors.grey,
              backgroundColor: currentTheme.primaryColor,
            ),
            Spacer(),
          ] 
        ),
      ),
      bottom: 30,
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:curso_disenios/src/theme/theme.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList()
          )
        ]
      )
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    double sizeWidth = MediaQuery.of(context).size.width;

    if (sizeWidth > 750)
      sizeWidth = sizeWidth - 300;

    return ButtonTheme(
      minWidth: sizeWidth * .9,
      height: 100,
      child: RaisedButton(
        onPressed: (){},
        color: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      slivers: <Widget>[
        //SliverAppBar(
        //  floating: true,
        //  elevation: 0,
        //  backgroundColor: Colors.red,
        //  title: Text('Hola mundo'),
        //),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 150, 
            maxHeight: 170, 
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: _HeaderTitle(),
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100)
          ])
        )
      ],
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

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryColor = (appTheme.darkTheme) ? Colors.grey : Color(0xff532128);
    final secondaryColor = (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Color(0xffF93A30);
    final lineTitle = (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5);

    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Text('New', 
            style: TextStyle(color: primaryColor, fontSize: 50),
          ),
        ),

        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 160,
                height: 8,
                color: lineTitle,
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: secondaryColor, fontSize: 50, fontWeight: FontWeight.bold),),
            )
          ],
        )
      ],
    );
  }
}

class _TodoItem extends StatelessWidget {
  final String title;
  final Color color;

  _TodoItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(this.title, 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: 20)
        ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? appTheme.currentTheme.cardColor : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}
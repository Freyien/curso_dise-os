import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ 
    @required this.onPressed, 
    @required this.icon });
}

class PinterestMenu extends StatelessWidget{
  final bool show;
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List<PinterestButton> items;

  //final List<PinterestButton> items = [
  //  PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart'); }),
  //  PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search'); }),
  //  PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications'); }),
  //  PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); })
  //];

  PinterestMenu({
    this.show = true,
    this.backgroundColor  = Colors.white,
    this.primaryColor     = Colors.pink,
    this.secondaryColor   = Colors.blueGrey, 
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: FadeIn(
        delay: Duration(milliseconds: 350),
        duration: Duration(milliseconds: 500),
        child: AnimatedOpacity(
          opacity: (show) ? 1 : 0,
          duration: Duration(microseconds: 250),
          child: Builder(
            builder: (BuildContext context) {
              final provider = Provider.of<_MenuModel>(context);
              provider.backgroundColor = this.backgroundColor;
              provider.primaryColor = this.primaryColor;
              provider.secondaryColor = this.secondaryColor;

              return _PinterestMenuBackground(
                child: _MenuItems( items )
              );
            },
          )
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({ @required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(60),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            spreadRadius: -2
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems( this.menuItems );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton( i, menuItems[i] )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<_MenuModel>(context);
    final itemSelected = provider.itemSelected;
    final primaryColor = provider.primaryColor;
    final secondaryColor = provider.secondaryColor;
    final isSelected = (itemSelected == index);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon,
          size: isSelected ? 30 : 25,
          color: isSelected ? primaryColor : secondaryColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color _backgroundColor;
  Color _primaryColor;
  Color _secondaryColor;

  int get itemSelected => this._itemSelected;
  set itemSelected( int itemSelected ) {
    this._itemSelected = itemSelected;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor( Color backgroundColor ) {
    this._backgroundColor = backgroundColor;
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor( Color primaryColor ) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor( Color secondaryColor ) {
    this._secondaryColor = secondaryColor;
  }
}
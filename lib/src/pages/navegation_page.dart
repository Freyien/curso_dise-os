import 'package:curso_disenios/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:curso_disenios/src/widgets/appbar.dart';

class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: simpleAppbar(title: 'Notifications', backgroundColor: currentTheme.accentColor),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        final provider = Provider.of<_NotificationModel>(context, listen: false);
        
        int number = provider.number;
        number++;

        provider.number ++;
        
        if ( number >= 2 ) {
          final controller = provider.bounceController;
          controller.forward( from: 0.0 );
        }

      },
      child: FaIcon(FontAwesomeIcons.play, color: Colors.white)
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int notificationNumber = Provider.of<_NotificationModel>(context).number;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: currentTheme.accentColor,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          title: Text('Bones')
        ),

        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell, size: 30,),

              Positioned(
                top: 0,
                right: 0,
                child: _NotificationCounter(notificationNumber: notificationNumber),
              )
            ],
          )
        ),

        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          title: Text('My Dog')
        )
      ],
    );
  }
}

class _NotificationCounter extends StatelessWidget {
  final int notificationNumber;

  _NotificationCounter({ @required this.notificationNumber });

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return BounceInDown(
      from: 10,
      animate: notificationNumber > 0 ? true : false,
      child: Bounce(
        controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
        from: 10,
        child: Container(
          width: 20,
          height: 20,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: currentTheme.accentColor,
            shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: Text(
            '$notificationNumber', 
            style: TextStyle(color: Colors.white, fontSize: 11)
          ),
        ),
      ),
    );
  }
}


class _NotificationModel extends ChangeNotifier{
  int _number = 0;
  AnimationController _bounceController;

  int get number => this._number;

  set number(int number) {
    this._number = number;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController bounceController) {
    this._bounceController = bounceController;
  }

}


import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme   = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  //Constructor
  ThemeChanger( int theme ) {
    switch ( theme ) {
      case 1:
          _darkTheme = false;
          _customTheme = false;
          _currentTheme = ThemeData.light();
        break;
      case 2:
          _darkTheme = true;
          _customTheme = false;
          _currentTheme = ThemeData.dark().copyWith(
            accentColor: Colors.pink,
            colorScheme: ColorScheme.dark(
              secondary: Colors.pink
            )
          );
        break;
      case 3:
          _darkTheme = false;
          _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  //Getters
  bool get darkTheme    => this._darkTheme;
  bool get customTheme  => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  //Setters
  set darkTheme(bool darkTheme) {
    this._customTheme = false;
    this._darkTheme = darkTheme;

    if (darkTheme)
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.pink,
        colorScheme: ColorScheme.dark(
          secondary: Colors.pink
        )
      );
    else
      _currentTheme = ThemeData.light();

    notifyListeners();
  }

  set customTheme(bool customTheme) {
    this._darkTheme = false;
    this._customTheme = customTheme;

    if (customTheme)
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        canvasColor: Color(0xff16202B),
        backgroundColor: Colors.red,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white
          )
        ),
        colorScheme: ColorScheme.dark(
          secondary: Color(0xff48A0EB)
        )
        
      );
    else
      _currentTheme = ThemeData.light();

    notifyListeners();
  }
}
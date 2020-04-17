import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:curso_disenios/src/theme/theme.dart';

import 'package:curso_disenios/src/pages/launcher_page.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger( 2 ),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: currentTheme,
      routes: {
        '/'           : (context) => LauncherPage(),
      },
    );
  }
}
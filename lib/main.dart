import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:curso_disenios/src/theme/theme.dart';
import 'package:curso_disenios/src/models/layout_model.dart';

import 'package:curso_disenios/src/pages/launcher_page.dart';
import 'package:curso_disenios/src/pages/launcher_tablet_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger( 2 )),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
    ],
    child: MyApp()
  )
);

//void main() => runApp(
//  ChangeNotifierProvider(
//    create: (_) => new ThemeChanger( 2 ),
//    child: MyApp()
//  )
//);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          //print('Orientation $orientation');

          final screenSize = MediaQuery.of(context).size;
          
          if (screenSize.width > 750) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
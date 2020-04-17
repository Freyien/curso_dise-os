import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:curso_disenios/src/widgets/appbar.dart';
import 'package:curso_disenios/src/widgets/headers.dart';
import 'package:curso_disenios/src/theme/theme.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: simpleAppbar(backgroundColor: currentTheme.accentColor, elevation: 0, title: 'Header Wave'),
      body: HeaderWave(color: currentTheme.accentColor),
    );
  }
}
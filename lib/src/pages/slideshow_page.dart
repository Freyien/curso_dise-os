import 'package:curso_disenios/src/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:curso_disenios/src/theme/theme.dart';
import 'package:curso_disenios/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: 'Slideshow'),
      body: Column(
        children: <Widget>[
          Expanded(child: MySlideshow())
        ],
      )
    );
  }
}

class MySlideshow extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final sufix = (appTheme.darkTheme) ? 'p' : 'b';

    return Slideshow(
      positionTop: false,
      primaryColor: appTheme.currentTheme.accentColor,
      //secondaryColor: appTheme.currentTheme.primaryColor,
      primaryBullet: 15.0,
      secondaryBullet: 5.0,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1-$sufix.svg'),
        SvgPicture.asset('assets/svg/slide-2-$sufix.svg'),
        SvgPicture.asset('assets/svg/slide-3-$sufix.svg'),
        SvgPicture.asset('assets/svg/slide-4-$sufix.svg'),
        SvgPicture.asset('assets/svg/slide-5-$sufix.svg'),
        SvgPicture.asset('assets/svg/slide-6-$sufix.svg'),
      ],
    );
  }
}
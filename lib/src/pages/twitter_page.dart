import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          from: 30,
          duration: Duration(seconds: 1),
          delay: Duration(milliseconds: 500),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:curso_disenios/src/pages/radial_progress_page.dart';
import 'package:curso_disenios/src/pages/emergency_page.dart';
import 'package:curso_disenios/src/pages/slideshow_page.dart';
import 'package:curso_disenios/src/pages/pinterest_page.dart';
import 'package:curso_disenios/src/pages/sliver_list_page.dart';
import 'package:curso_disenios/src/pages/header_page.dart';
import 'package:curso_disenios/src/pages/navegation_page.dart';
import 'package:curso_disenios/src/pages/twitter_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.heading, 'Header Wave', HeadersPage()),
  _Route(FontAwesomeIcons.chartPie, 'Radial Progress', RadialProgressPage()),
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest Menu', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
  _Route(FontAwesomeIcons.play, 'Notifications', NavigationPage()),
  _Route(FontAwesomeIcons.twitter, 'Twitter Animation', TwitterPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
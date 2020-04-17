import 'package:flutter/material.dart';

AppBar simpleAppbar({ String title = '', Color backgroundColor, List<Widget>children, double elevation,}) {
  return AppBar(
    backgroundColor: backgroundColor,
    title: Text(title),
    actions: children,
    elevation: elevation,
  );
}
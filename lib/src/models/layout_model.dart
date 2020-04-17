import 'package:flutter/material.dart';

import 'package:curso_disenios/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
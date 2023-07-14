import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String _theme;
  String get theme => _theme;

  ThemeProvider(this._theme);

  changeTheme() {
    if (_theme == 'pink') {
      _theme = 'indigo';
    } else {
      _theme = 'pink';
    }
    notifyListeners();
  }
}

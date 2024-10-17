import 'package:flutter/material.dart';
import 'package:aladia/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightmode) {
      _themeData = darkmode;
    } else {
      _themeData = lightmode;
    }
    _isSelected = !_isSelected;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:aladia/theme.dart'; // Ensure you are importing your theme file here

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  ThemeData _themeData = lightmode; // Default to light mode
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightmode) {
      _themeData = darkmode;
    } else {
      _themeData = lightmode;
    }
    _isSelected = !_isSelected; // Toggle the selection
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}

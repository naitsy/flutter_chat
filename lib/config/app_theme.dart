import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF00BFA6);
const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.black,
  Colors.blue,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
    );
  }
}

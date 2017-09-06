import 'package:flutter/material.dart';

class ThemeProvider {
  ThemeData getiOSTheme() {
    return new ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.grey[100],
      primaryColorBrightness: Brightness.light,
    );
  }

  ThemeData getAndroidTheme() {
    return new ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.orangeAccent[400],
    );
  }
}
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/CodysChatApp.dart';
import 'package:hello_flutter/ThemeProvider.dart';

final _themeProvider = new ThemeProvider();

void main() {
  runApp(
      new CodysChatApp(
          iOSTheme: _themeProvider.getiOSTheme(),
          androidTheme: _themeProvider.getAndroidTheme())
  );
}
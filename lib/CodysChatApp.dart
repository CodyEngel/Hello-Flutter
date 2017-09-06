import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_flutter/ChatScreen.dart';

class CodysChatApp extends StatelessWidget {
  final ThemeData iOSTheme;
  final ThemeData androidTheme;

  CodysChatApp({this.iOSTheme, this.androidTheme});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Cody's Chat App",
      theme: defaultTargetPlatform == TargetPlatform.iOS ? iOSTheme : androidTheme,
      home: new ChatScreen(),
    );
  }
}
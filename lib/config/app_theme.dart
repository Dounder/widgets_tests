import 'package:flutter/material.dart';

class AppTheme {
  final bool darkMode;

  const AppTheme({this.darkMode = false});

  ThemeData get() => ThemeData(
    brightness: darkMode ? Brightness.dark : Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  final bool darkMode;

  const AppTheme({this.darkMode = false});

  ThemeData get() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: darkMode ? Brightness.dark : Brightness.light,
    ),
  );
}

import 'package:flutter/material.dart';

enum AppThemeMode { light, dark, system }

class AppTheme {
  static final Map<AppThemeMode, ThemeData> appTheme = {
    AppThemeMode.dark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purpleAccent,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purpleAccent))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purpleAccent))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purpleAccent))),
    ),
    AppThemeMode.light: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.pinkAccent,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent))),
    ),
    AppThemeMode.system: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.tealAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.tealAccent))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.tealAccent))),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.tealAccent)))
    )
  };

  AppTheme._();
}

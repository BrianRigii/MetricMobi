import 'package:flutter/material.dart';

class AppConfig {
  static const appUrl = 'https://metric.co.ke/api';

  static ThemeData themedata = ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Color.fromRGBO(37, 41, 75, 1),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(37, 41, 75, 1)),
      inputDecorationTheme: InputDecorationTheme(
          prefixStyle: TextStyle(color: Color.fromRGBO(37, 41, 75, 1)),
          labelStyle: TextStyle(
            color: Color.fromRGBO(37, 41, 75, 1),
          )));
}

AppConfig appConfig = AppConfig();

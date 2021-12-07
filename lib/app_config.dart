import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig {
  static const appUrl = 'https://metric.co.ke/api';

  static ThemeData themedata = ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white)),
      primaryColor: Color.fromRGBO(37, 41, 75, 1),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white)),
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

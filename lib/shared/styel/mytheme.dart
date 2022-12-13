import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: greenBackground,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: greenBackground,
          onSecondary: primaryColor,
          error: Colors.red,
          onError: Colors.white,
          background: greenBackground,
          onBackground: primaryColor,
          surface: Colors.grey,
          onSurface: Colors.black),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorGreen),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 30),
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkPrimary,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: darkPrimary,
          onPrimary: Colors.white10,
          secondary: darkPrimary,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: darkPrimary,
          onBackground: primaryColor,
          surface: Colors.grey,
          onSurface: Colors.white),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: darkPrimary,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorGreen),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey));
}

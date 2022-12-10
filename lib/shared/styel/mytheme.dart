import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: colorGold,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorGold,
        onPrimary: colorWhite,
        secondary: colorBlack,
        onSecondary: colorWhite,
        error: colorRed,
        onError: colorWhite,
        background: Colors.transparent,
        onBackground: colorBlack,
        surface: Colors.grey,
        onSurface: colorWhite),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorBlack),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorGold,
      unselectedItemColor: colorWhite,
      selectedItemColor: colorBlack,
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    primaryColor: colorPrimaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: colorPrimaryDark,
        onPrimary: colorWhite,
        secondary: colorYellow,
        onSecondary: colorWhite,
        error: colorRed,
        onError: colorWhite,
        background: Colors.transparent,
        onBackground: colorYellow,
        surface: Colors.grey,
        onSurface: colorWhite),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorWhite),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: colorWhite,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: colorYellow,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorPrimaryDark,
      unselectedItemColor: colorWhite,
      selectedItemColor: colorYellow,
    ),
  );
}
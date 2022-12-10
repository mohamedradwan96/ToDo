import 'package:flutter/material.dart';
import 'package:to_do/shared/styel/mytheme.dart';

import 'layout/home_layout.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes:  {
        HomeLayout.routeName:(context)=>HomeLayout(),

      },
      debugShowCheckedModeBanner: false,
      theme:  MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode:ThemeMode.light ,


    );
  }
}



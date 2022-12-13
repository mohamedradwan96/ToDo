import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/app_provider.dart';
import 'package:to_do/shared/styel/mytheme.dart';

import 'layout/home_layout.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(

      initialRoute: HomeLayout.routeName,
      routes:  {
        HomeLayout.routeName:(context)=>HomeLayout(),

      },
      debugShowCheckedModeBanner: false,
      theme:  MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode:provider.mode ,


    );
  }
}



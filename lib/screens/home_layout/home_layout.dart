import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:to_do/shared/styel/colors.dart';

import '../add_task/add_task_bottom_sheet.dart';
import '../settings/setting.dart';
import '../tasks_list/task_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TO DO'),
            Icon(Icons.drive_file_rename_outline)

          ],
        ),),
      bottomNavigationBar:CurvedNavigationBar(
        color: primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.ease,
        height: 50,
        items:const <Widget> [
         Icon(Icons.list,size: 30),
          Icon(Icons.add_circle_outlined,size: 50,),
        Icon(Icons.settings,size: 30,),
        ],
        index:currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
     TasksListScreen(),
      TaskBottomSheet(),
      SettingsTab(),
  ];

  // void showAddTaskBottomSheet() {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (context) => TaskBottomSheet());
  //
  // }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:to_do/modules/settings/setting.dart';
import 'package:to_do/modules/tasks_list/task_list.dart';
import 'package:to_do/shared/styel/colors.dart';

import 'add_task_bottom_sheet.dart';

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
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   shape: const StadiumBorder(
      //       side: BorderSide(color: Colors.white, width: 2)),
      //   onPressed: () {
      //     showAddTaskBottomSheet();
      //   },
      //   child: const Icon(Icons.add, color: Colors.yellow),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => TaskBottomSheet());
  }
}

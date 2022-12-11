
import 'package:flutter/material.dart';
import 'package:to_do/modules/settings/setting.dart';
import 'package:to_do/modules/tasks_list/task_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      floatingActionButton:FloatingActionButton(
        shape:const StadiumBorder(side: BorderSide(color: Colors.white,width: 2)),
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 7,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index ;
            setState(() {

            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      body:tabs[currentIndex] ,
    );
  }
  List<Widget>tabs =[
    const TasksListScreen(),
    const SettingsScreen(),

  ];
}

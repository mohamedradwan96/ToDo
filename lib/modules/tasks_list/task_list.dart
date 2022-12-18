import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/modules/tasks_list/task_item.dart';
import 'package:to_do/shared/styel/colors.dart';

import '../../shared/network/local/firebase_utils.dart';

class TasksListScreen extends StatefulWidget {
  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
 DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract( Duration(days: 365)),
          lastDate: DateTime.now().add( Duration(days: 365)),
          onDateSelected: (date){
            selectedDate=date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.onSurface,
          dayColor: Theme.of(context).colorScheme.onSecondary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        StreamBuilder<QuerySnapshot<Task>>(
          stream: getTasksFromFireStore(selectedDate),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return  const Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return  const Center(child: Text("SomeThings Went Wrong"));
            }
            var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
            if(tasks.isEmpty){
              return Text("NO DATA");
            }
            return Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context,index)=>
              TaskItem(tasks[index]),
              ),
            );


          },
        )
      ],
    );
  }
}

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/modules/tasks_list/task_item.dart';
import 'package:to_do/shared/styel/colors.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 100000)),
            lastDate: DateTime.now().add(Duration(days: 100000)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: colorBlack,
            dayColor: primaryColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primaryColor,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
                itemCount:15 ,
                itemBuilder: ((context, index) =>TaskItem() )),
          )
        ],
      ),
    );
  }
}

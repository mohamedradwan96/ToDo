import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/modules/tasks_list/task_item.dart';
import 'package:to_do/shared/styel/colors.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 100000)),
          lastDate: DateTime.now().add(const Duration(days: 100000)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.onSurface,
          dayColor: Theme.of(context).colorScheme.onSecondary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: ((context, index) => const TaskItem())),
        )
      ],
    );
  }
}

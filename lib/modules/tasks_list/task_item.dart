import 'package:flutter/material.dart';
import 'package:to_do/shared/styel/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 5,
              color: primaryColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Title",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const Text("Task Description"),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ));
  }
}

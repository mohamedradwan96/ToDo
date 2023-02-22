import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/shared/network/local/firebase_utils.dart';
import '../../shared/componants/componnet.dart';
import '../../shared/styel/colors.dart';
import '../../widegets/edittask_dialog.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem(this.task);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  var titelControler = TextEditingController();
  var descriptionControler = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const BehindMotion(), children: [
        SlidableAction(
          autoClose: true,
          borderRadius: BorderRadius.circular(12),
          onPressed: (context) {
            deleteTaskFromFireStore(widget.task.id);
          },
          backgroundColor: Colors.red,
          icon: (Icons.delete),
          label: "Delete",
        ),
        SlidableAction(
          autoClose: true,
          borderRadius: BorderRadius.circular(12),
          onPressed: (context) {
            titelControler.text = widget.task.title;
            descriptionControler.text = widget.task.description;
            selectedDate= DateTime.fromMicrosecondsSinceEpoch(widget.task.date);
            showDialog(
                context: context,
                builder: (context) {
                  return
                    EditTAshDialog(widget.task);
                });
          },
          icon: Icons.edit,
          backgroundColor: Colors.blue,
          label: "Edit",
        )
      ]),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color:
                    (widget.task.isdone == false) ? Colors.blue : Colors.green,
                width: 3),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (widget.task.isdone == false)
                          ? Colors.blue
                          : Colors.green,
                      width: 3),
                  color: (widget.task.isdone == false)
                      ? Colors.blue
                      : Colors.green,
                ),
                height: 80,
                width: 5,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(widget.task.description),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ((widget.task.isdone == false)
                        ? Colors.blue
                        : Colors.green)),
                onPressed: () {
                  widget.task.isdone = true;
                  setState(() {
                    isDoneTask(widget.task.id, widget.task.isdone);
                  });
                },
                child: Icon(
                  (widget.task.isdone == false)
                      ? Icons.done
                      : Icons.done_outline_sharp,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          )),
    );
  }
}

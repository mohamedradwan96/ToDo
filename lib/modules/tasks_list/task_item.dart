import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/shared/network/local/firebase_utils.dart';
import 'package:to_do/shared/styel/colors.dart';

import '../../shared/componants/componnet.dart';

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
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Edit Task",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontSize: 26,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Form(
                              key: formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    style: TextStyle(
                                        inherit: true,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                    controller: titelControler,
                                    validator: (text) {
                                      if (text == '') {
                                        return "Please Enter Title";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        label: Text("Title"),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 2,
                                          color: primaryColor,
                                        )),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: primaryColor))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                        inherit: true,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                    maxLines: 3,
                                    controller: descriptionControler,
                                    validator: (text) {
                                      if (text == '') {
                                        return "Please Enter Description";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        label: Text("Description"),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 2,
                                          color: primaryColor,
                                        )),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: primaryColor))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Select Date",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface)),
                                  InkWell(
                                    onTap: () {
                                      ShowdatePiker(context);
                                    },
                                    child: Text(
                                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor),
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          showloading(context, 'Loading...');
                                          updateTask(
                                            widget.task.id,
                                            titelControler.text,
                                            descriptionControler.text,
                                            selectedDate.microsecondsSinceEpoch,
                                          ).then((value) {
                                            hideloading(context);
                                            showmessage(
                                                context,
                                                'Task Updated Successfully',
                                                'OK', () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            });
                                          }).catchError((error) {
                                            print(error);
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "Update Task",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ))
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
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
              color:(widget.task.isdone==false)?Colors.blue:Colors.green,
              width:3
            ),
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
                      color:(widget.task.isdone==false)?Colors.blue:Colors.green,
                      width:3
                  ),
                  color: (widget.task.isdone==false)?Colors.blue:Colors.green,
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
                child:Icon((widget.task.isdone==false)?Icons.done:Icons.done_outline_sharp, color: Colors.white, size: 40,),
              ),
            ],
          )),
    );
  }

  void ShowdatePiker(context) async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    setState(() {
      if (chosendate == null) return;
      selectedDate = chosendate;
    });
  }
}

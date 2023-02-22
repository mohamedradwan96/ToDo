import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do/shared/network/local/firebase_utils.dart';
import 'package:to_do/shared/styel/colors.dart';
import '../../services/notifications.dart';
import '../../shared/componants/componnet.dart';
import '../../widegets/custom_text_formfield.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}
class _TaskBottomSheetState extends State<TaskBottomSheet> {


  late final NotificationService service;

  var titelControler = TextEditingController();
  var descriptionControler = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Text(
              "Add New Task",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontSize: 26,
                  ),
            ),
            const SizedBox(height: 10),
            Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      maxLines: 1,
                      controlled: titelControler,
                      validateMessage: "Title",
                      labelText: "Title",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      maxLines: 3,
                      controlled: descriptionControler,
                      validateMessage: "Description",
                      labelText: "Description",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Select Date",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface)),
                    InkWell(
                      onTap: () {
                        ShowdatePiker(context);
                      },
                      child: Text(
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
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
                            Task task = Task(
                              title: titelControler.text,
                              description: descriptionControler.text,
                              date: DateUtils.dateOnly(selectedDate)
                                  .microsecondsSinceEpoch,
                            );
                            showloading(context, 'Loading...');
                            addTasksToFireStore(task);
                            hideloading(context);
                            showmessage(context, 'Task Add Successfully', 'OK',
                                () {
                              Navigator.pop(context);
                            });
                          }
                         NotificationService().showNotification(
                             1,
                             "TODO TASKS",
                             "TASK:${titelControler.text} ..... Successfully Added ✌️",
                             1);
                        },
                        child: const Text(
                          "Add Task",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))
                  ],
                ))
          ],
        ),
      ),
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
      selectedDate = DateUtils.dateOnly(chosendate);
    });
  }
}

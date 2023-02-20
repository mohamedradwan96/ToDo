import 'package:flutter/material.dart';

import '../models/task.dart';
import '../shared/componants/componnet.dart';
import '../shared/network/local/firebase_utils.dart';
import '../shared/styel/colors.dart';

class EditTAshDialog extends StatefulWidget {
  Task task;
  EditTAshDialog(this.task);

  @override
  State<EditTAshDialog> createState() => _EditTAshDialogState();
}

class _EditTAshDialogState extends State<EditTAshDialog> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var titelControler = TextEditingController();
  var descriptionControler = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titelControler.text = widget.task.title;
    descriptionControler.text = widget.task.description;
    selectedDate= DateTime.fromMicrosecondsSinceEpoch(widget.task.date);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return  Dialog(
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
              ),),
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
                      controller:titelControler,
                      // onChanged: (value) {
                      //   widget.task.title = value;
                      // }
                      validator: (text) {
                        if (text == '') {
                          return "Please Enter Title";
                        }
                        return null;
                      },
                      decoration:   const InputDecoration(
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
                      // onChanged: (value) {
                      //   widget.task.description = value;
                      // },
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
                            widget.task.title= titelControler.text;
                            widget.task.description= descriptionControler.text;
                            widget.task.date= DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch;
                            showloading(context, 'Loading...');
                            updateTask( widget.task );
                            hideloading(context);
                            showmessage(
                                context,
                                'Task Updated Successfully',
                                'OK', () {
                              Navigator.pop(context);
                              Navigator.pop(context);
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
  }
  void ShowdatePiker(context) async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        initialDate: selectedDate ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosendate == null) return;
    selectedDate = DateUtils.dateOnly(chosendate);
    print(selectedDate);
    setState(() {
    });
  }
}

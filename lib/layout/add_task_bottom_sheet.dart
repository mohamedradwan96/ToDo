import 'package:flutter/material.dart';
import 'package:to_do/shared/styel/colors.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titelControler = TextEditingController();
  var descriptionControler = TextEditingController();
  GlobalKey <FormState> formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selecteTime = TimeOfDay(hour: 8, minute: 30);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Text(
              "Add New Task",
              style:
                  Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 26,),
            ),
            const SizedBox(height: 10),
            Form(
                key: formkey,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  style: TextStyle(inherit: true,color:Theme.of(context).colorScheme.onSurface),
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
                          borderSide: BorderSide(width: 2, color: primaryColor))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(inherit: true,color:Theme.of(context).colorScheme.onSurface),
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
                          borderSide: BorderSide(width: 2, color: primaryColor))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Select Date",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 20, color: Theme.of(context).colorScheme.onSurface)),
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
                Text("Select Time",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 20, color:Theme.of(context).colorScheme.onSurface)),
                InkWell(
                  onTap: () {
                    ShowTimePiker(context);
                  },
                  child: Text(
                    "${selecteTime.hour}:${selecteTime.minute} ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:primaryColor),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Add Task",
                      style: TextStyle(fontSize: 18,color: Colors.white),
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
        lastDate: DateTime.now().add(Duration(days: 10000000)));
    setState(() {
      if (chosendate == null) return;
      selectedDate = chosendate;
    });
  }

  void ShowTimePiker(context) async {
    TimeOfDay? chosentime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay(hour: selecteTime.hour, minute: selecteTime.minute));
    setState(() {
      if (chosentime == null) return;
      selecteTime = chosentime;
    });
  }
}

import 'package:flutter/material.dart';

import '../models/task.dart';
import '../shared/styel/colors.dart';

class CustomTextFormField extends StatelessWidget {
  var controlled = TextEditingController();
  String validateMessage ;
  String labelText ;
  int maxLines;



  CustomTextFormField({required this.maxLines,required this.controlled, required this.validateMessage,required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          inherit: true,
          color: Theme.of(context).colorScheme.onSurface),
      maxLines: maxLines,
      controller: controlled,
      validator: (text) {
        if (text == '') {
          return "Please Enter $validateMessage";
        }
        return null;
      },
      decoration:  InputDecoration(
          label: Text(labelText),
          labelStyle: const TextStyle(
              color: primaryColor),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: primaryColor,
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(width: 2, color: primaryColor))));
  }
}

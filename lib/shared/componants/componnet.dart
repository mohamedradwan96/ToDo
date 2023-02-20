import 'package:flutter/material.dart';

showloading(BuildContext context, String message){

  showDialog(context: context,
      barrierDismissible: false,
      builder: (context)=>AlertDialog(
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children:  [
              CircularProgressIndicator(),
              SizedBox(width: 10,),
              Text(message),
            ],
          ),
        ) ,));
}



hideloading( BuildContext context){

  Navigator.pop(context);
}


void showmessage(BuildContext context, String message, String posBtn,VoidCallback posAction){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(message),
      actions: [
        TextButton(onPressed: posAction, child: Text(posBtn))
      ],

    );


  });
}
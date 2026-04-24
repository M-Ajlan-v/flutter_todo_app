import 'package:begin/util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final  controller;

  VoidCallback onSave;
  VoidCallback onCancel;


   DialogBox({super.key,
    required this.controller,
     required this.onSave,
     required this.onCancel,
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[800],
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextField(
             style: TextStyle(color: Colors.white),
             controller: controller,
             decoration: InputDecoration(

               hintText: "Add Task",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),

                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText:"hello",
             ),
           ),
           const SizedBox(height: 20),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               MyButton(text: "Cancel", onPressed: onCancel),
               MyButton(text: "Save", onPressed: onSave)
             ],
           )
         ],
        )
      ),
    );
  }
}

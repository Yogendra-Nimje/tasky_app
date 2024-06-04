import 'package:flutter/material.dart';
import 'package:tasky_app/Util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
     super.key,
     this.controller,
     required this.onSave,
     required this.onCancel,
   });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purpleAccent[50],
      content: Container(
        height: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task"
              ),
              controller: controller,
            ),
            //button -> save +cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //save Button
                MyButton(text: "Save", onPressed: onSave),


                //spacer
                const SizedBox(width: 8,),

                //cancel Button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

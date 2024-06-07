import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key,
    required this.text,
    required this.onPressed
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      color: Colors.blue[400] ,
      child: Text(widget.text,style: const TextStyle(color: Colors.white),),
    );
  }
}

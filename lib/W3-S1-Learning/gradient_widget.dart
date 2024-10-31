import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.text, this.fontSize, this.start, this.end, {super.key});

  final String text;
  final double fontSize;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [start, end]),
        borderRadius: BorderRadius.circular(10),
        //color: Colors.blue,
      ),
      child: Text(text,
          style: TextStyle(   // remove const from textstyle cuz size is change.
              color: Colors.white,
              fontSize: fontSize,
              decoration: TextDecoration.none)),
    );
  }
}
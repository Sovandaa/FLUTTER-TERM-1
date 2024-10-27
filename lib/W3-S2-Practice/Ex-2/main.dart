import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(35),
      margin: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        color: Colors.lightBlue
      ),
      child: Container(
        decoration: BoxDecoration( color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Center(
          child: Text("CADT STUDENTS", style: TextStyle(
            fontSize: 26, color: Colors.white),
            ),
        ),
      ),
    ),
  ));
}

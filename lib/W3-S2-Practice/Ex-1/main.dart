import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(backgroundColor: Colors.lightBlue,
      body: Center(
        child: Text("Hello, My name is Sovanda!", 
          style: TextStyle(
            color: Colors.deepOrangeAccent, fontSize: 24,
      ),)),
    ),
  ));
}


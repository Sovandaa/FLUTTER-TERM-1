import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
        home: Scaffold(
          body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.green, height: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.blue, height: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.red, height: 1000),
            )
          ],
        ),
      )),
  );
}
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Favorit cards"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("title"),
                  Textdes
                ],
              )),
          ],
        ),
      ),
    ),
  ));
}

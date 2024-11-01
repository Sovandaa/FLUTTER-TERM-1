// The Products
import 'package:flutter/material.dart';

String dartImage = "assets/W4-S1-images/dart.png";
String firebaseImage = "assets/W4-S1-images/firebase.png";
String flutterImage = "assets/W4-S1-images/flutter.png";

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar:  AppBar(
        title: const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    width: 100,
                      height: 70,
                      child: Image.asset(
                        dartImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  SizedBox(height: 10.0),
                  Text("Dart"),
                  SizedBox(height: 8.0),
                  Text("The best object language"),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ));
}


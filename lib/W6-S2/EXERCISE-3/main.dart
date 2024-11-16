import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-3/screen/temperature.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isCurrentScreen = true;  //start with welcome screen

  void switchScreen() {
    setState(() {
      isCurrentScreen = !isCurrentScreen;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Render Condition for change state
          child: isCurrentScreen
              ? Welcome(onPressedBtn: switchScreen) // welcome screen
              : Temperature(),  // show temperature screen 
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}

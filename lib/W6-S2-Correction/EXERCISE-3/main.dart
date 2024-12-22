import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S2-Correction/EXERCISE-3/screen/temperature.dart';
import 'package:flutter_workspace/W6-S2-Correction/EXERCISE-3/screen/welcome.dart';


enum Screen { welcomeScreen, temperatureScreen }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  Screen activeScreen = Screen.welcomeScreen;

  void showTemperature() {
    setState(() {
      activeScreen = Screen.temperatureScreen;
    });
  }

  Widget get currentScreen {
    return switch (activeScreen) {
      Screen.welcomeScreen => Welcome(onStart: showTemperature,),
      Screen.temperatureScreen => const Temperature(),
    };
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
          child: currentScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}

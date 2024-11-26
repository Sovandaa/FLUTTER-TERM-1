import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/screens/question_screen.dart';
import 'package:flutter_workspace/W7-S2/screens/result_screen.dart';
import 'package:flutter_workspace/W7-S2/screens/welcome_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState state =
      QuizState.notStarted; // onstarted, currentstarte = welcomeScreen

  void switchScreen(QuizState newState) {
    setState(() {
      state = newState;
    });
  }

  Widget getScreen() {
    switch (state) {
      case QuizState.notStarted:
        return WelcomeScreen(onStart: () => switchScreen(QuizState.started));
      case QuizState.started:
        return QuestionScreen(onFinish: () => switchScreen(QuizState.finished));
      case QuizState.finished:
        return ResultScreen(onRestart: () => switchScreen(QuizState.notStarted));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        
        body: getScreen(),
      ),
    );
  }
}

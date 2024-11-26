import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/screens/welcome_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState {WelcomeScreen, QuestionScreen, ResultScreen}
 
class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  
  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        // body: const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text('TODO !'),
        //     ],
        //   ),
        // ),
        body: const WelcomeScreen(),
      ),
    );
  }
}

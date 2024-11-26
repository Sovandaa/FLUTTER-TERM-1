
import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/model/submission.dart';
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
  QuizState state = QuizState.notStarted; // onstarted, currentstarte = welcomeScreen
  int questionIndex = 0;
  Submission? submission;

  String selectedAnswer = '';

  void switchScreen(QuizState newState) {
    setState(() {
      state = newState;
    });
  }

  void nextQuestion() {
    setState(() {
      Answer userAnswer = Answer(
          userAnswer: selectedAnswer, 
          question: widget.quiz.questions[questionIndex]
      );

      if (submission != null) {
        submission!.answers.add(userAnswer);
      } else {
        submission = Submission(answers: [userAnswer]);
      }

      if (questionIndex < widget.quiz.questions.length - 1) {
        questionIndex++;
      } else {
        switchScreen(QuizState.finished);
      }
    });
  }

  Widget getScreen() {
    switch (state) {
      case QuizState.notStarted:
        return WelcomeScreen(
          onStart: () => switchScreen(QuizState.started),
          quizTitle: widget.quiz.title,
        );
      case QuizState.started:
        return QuestionScreen(
          onTap: nextQuestion,
          question: widget.quiz.questions[questionIndex],
        );
      case QuizState.finished:
        return ResultScreen(
            onRestart: () => switchScreen(QuizState.notStarted), 
            submission: submission!, 
            quiz: widget.quiz,
          );
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

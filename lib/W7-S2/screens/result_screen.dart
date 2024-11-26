import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/model/quiz.dart';
import 'package:flutter_workspace/W7-S2/model/submission.dart';
import 'package:flutter_workspace/W7-S2/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen(
      {super.key,
      required this.onRestart,
      required this.submission,
      required this.quiz});

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You get $score on ${quiz.questions.length} questions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(),
          ),
          AppButton("Restart Quiz", onTap: onRestart, icon: Icons.restart_alt),
        ]),
      ),
    );
  }
}

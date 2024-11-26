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
            child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final userAnswer = submission.answers[index];
                  final correctAnswer = question.goodAnswer;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the question text
                          Text(
                            "Q${index + 1}: ${question.title}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Display the user's answer
                          Text(
                            "Your Answer: $userAnswer",
                            style: TextStyle(
                              fontSize: 16,
                              color: userAnswer == correctAnswer
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),

                          // Display the correct answer
                          Text(
                            "Correct Answer: $correctAnswer",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          AppButton("Restart Quiz", onTap: onRestart, icon: Icons.restart_alt),
        ]),
      ),
    );
  }
}

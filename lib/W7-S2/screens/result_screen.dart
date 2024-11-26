import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2/model/quiz.dart';
import 'package:flutter_workspace/W7-S2/model/submission.dart';
import 'package:flutter_workspace/W7-S2/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'You scored $score out of ${quiz.questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                for (int i = 0; i < quiz.questions.length; i++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Circle Avatar Replacement
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: submission.answers[i].userAnswer ==
                                    quiz.questions[i].goodAnswer
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              '${i + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Question Title
                              Text(
                                quiz.questions[i].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              
                              // Optional: Display all possible answers
                              for (var answer
                                  in quiz.questions[i].possibleAnswers) ...[
                                Text(
                                  "${submission.answers[i].userAnswer == answer ? "✓ " : ""}$answer",
                                  style: TextStyle(
                                    color: submission.answers[i].userAnswer ==
                                            answer
                                        ? (submission.answers[i].userAnswer ==
                                                quiz.questions[i].goodAnswer
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: AppButton(
              "Restart Quiz",
              onTap: onRestart,
              icon: Icons.restart_alt,
            ),
          ),
        ],
      ),
    );
  }
}

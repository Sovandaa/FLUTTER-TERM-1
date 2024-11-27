
import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';
import '../widgets/app_button.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: quiz.questions.length,
              itemBuilder: (context, i) {
                final question = quiz.questions[i];
                final userAnswer = submission.answers[i].userAnswer;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: userAnswer == question.goodAnswer
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
                            Text(
                              question.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            
                            for (var answer in question.possibleAnswers) ...[
                              Text(
                                submission.answers[i].userAnswer == answer
                                    ? (submission.answers[i].userAnswer == question.goodAnswer
                                        ? "✓ $answer" 
                                        : "$answer") 
                                    : answer, // no mark for other answer
                                style: TextStyle(
                                  fontSize: 16,
                                  color: submission.answers[i].userAnswer == answer
                                      ? (submission.answers[i].userAnswer == question.goodAnswer
                                          ? Colors.green
                                          : Colors.red)
                                      : Colors.black,
                                ),
                              ),
                            ],
                            const SizedBox(height: 8),
                            // Text(
                            //   'Correct Answer: ${question.goodAnswer}',
                            //   style: const TextStyle(fontSize: 16),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
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

import 'package:my_quiz/model/submission/submission.dart';

import '../model/app/app.dart';
import '../model/quiz/quiz.dart';

class QuizService {
  final App app;

  QuizService(this.app);

  ///
  /// Retrieves the list of questions a given participant has failed
  ///
  List<Question> getFailedQuestions(String participant) {
    List<Question> failedQuestions = [];

    for (Submision submission
        in app.submissions.where((s) => s.participant == participant)) {
      Quiz? quiz = app.getQuizFor(submission.quizId);

      if (quiz != null) {
        for (Question question in quiz.questions) {
          Answer? answer = submission.getAnswerFor(question.id);
          if (answer != null) {
            if (!question.isCorrect(answer)) {
              failedQuestions.add(question);
            }
          }
        }
      }
    }

    return failedQuestions;
  }

  ///
  /// Calculates the average score for a given question
  ///
  double getAverageScoreForQuestion(Question question) {
    int totalScore = 0;
    int attempts = 0;

    for (Submision submission in app.submissions) {
      Answer? answer = submission.getAnswerFor(question.id);
      if (answer != null) {
        totalScore += question.getScore(answer);
        attempts++;
      }
    }

    return attempts > 0 ? totalScore / attempts : 0.0;
  }
}

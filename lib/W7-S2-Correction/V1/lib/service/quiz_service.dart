import '../model/app/app.dart';
import '../model/quiz/quiz.dart';
import '../model/submission/submission.dart';

class QuizService {
  final App app;

  QuizService(this.app);

  ///
  /// Retrieves the list of questions a given participant has failed
  ///
  List<Question> getFailedQuestions(String participant) {
    List<Question> failedQuestions = [];

    for (Submision submission in app.submissions.where((s) => s.participant == participant)) {
      for (Answer answer in submission.anwers) {
        if (!answer.question.isCorrect(answer)) {
          failedQuestions.add(answer.question);
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
      Answer? answer = submission.getAnswerFor(question);
      if (answer != null) {
        totalScore += question.getScore(answer);
        attempts++;
      }
    }

    return attempts > 0 ? totalScore / attempts : 0.0;
  }
}

import '../quiz/quiz.dart';
import '../submission/submission.dart';

class App {
  final List<Quiz> quizzes;
  final List<Submision> submissions;

  App({required this.quizzes, required this.submissions});

  void addQuiz(Quiz quiz) {
    quizzes.add(quiz);
  }

  void addSubmission(Submision submission) {
    submissions.add(submission);
  }

  Quiz? getQuizFor(String quizId) {
    return quizzes.firstWhere((q) => q.id == quizId);
  }

  ///
  /// Calculates the score for given submission
  ///
  int getScore(Submision submission) {
    
    // 1- Get the quiz
    Quiz? quiz = getQuizFor(submission.quizId);
    if (quiz == null) {
      throw Exception(
          "Cannot retrieve the quiz with the id: $submission.quizId");
    }

    // 2- Browse the question and update socre if answer if correct
    int score = 0;
    for (Answer answer in submission.anwers) {
      Question? question = quiz.getQuestionFor(answer.questionId);
      if (question == null) {
        throw Exception("Question related to the submission cannot be retreived");
      }
      score += question.isCorrect(answer) ? question.points : 0;
    }

    return score;
  }
}

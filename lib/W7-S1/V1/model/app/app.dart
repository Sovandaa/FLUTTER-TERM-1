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
}

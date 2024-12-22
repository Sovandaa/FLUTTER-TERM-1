import 'package:my_quiz/model/quiz/quiz.dart';
import '../submission/submission.dart';
import 'package:json/json.dart';

@JsonCodable()
class App {
  final List<Quiz> quizzes;
  final List<Submision> submissions;
 
  App({required this.quizzes, required this.submissions});

  void addQuiz(Quiz quiz) {
    quizzes.add(quiz);
  } 
  
  Quiz? getQuizFor(String quizId) {
    return quizzes.firstWhere((q) => q.id == quizId);
  }

  void addSubmission(Submision submission) {
    submissions.add(submission);
  }

  ///
  /// Calculates the score for given submission
  ///
  int getScore(Submision submission) {
    Quiz? quiz = getQuizFor(submission.quizId);
    if (quiz == null) {
      throw Exception("Quiz related to the submission cannot be retreived");
    }

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

  void printStatus() {
    for (Submision submission in submissions) {
      print("Participant:\t" + submission.participant);
 
      Quiz? quiz = getQuizFor(submission.quizId);
      if (quiz == null) {
      throw Exception("Quiz related to the submission cannot be retreived");
      }

      int score = getScore(submission);
      int total = quiz.points;
      print(" - Overwall:\t" +  score.toString() +  "/" +  total.toString() + " points");

      print(" - Per questions:");
      for (Question question in quiz.questions) {
        Answer? answer = submission.getAnswerFor(question.id);
        if (answer != null) {
          int score = question.getScore(answer);
          int total = question.points;
          print("\t- Question: " + question.title);
          print("\t- Score: " +  score.toString() +   "/" +  total.toString() + " point");   
          print("\n");
        }
      }
      print("\n");
    }
  }
}

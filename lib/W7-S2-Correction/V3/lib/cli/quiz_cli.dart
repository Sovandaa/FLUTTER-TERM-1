import '../model/app/app.dart';
import '../model/quiz/quiz.dart';
import '../model/submission/submission.dart';

void printApp(App app) {
  for (Submision submission in app.submissions) {
    print("Participant:\t" + submission.participant);
 
    Quiz? quiz = app.getQuizFor(submission.quizId);
    if (quiz ==null) {
        throw Exception("Cannot retrieve quiz");
    }
    int score = app.getScore(submission);
    int total = quiz.points;
    print(" - Overwall:\t" +
        score.toString() +
        "/" +
        total.toString() +
        " points");

    print(" - Per questions:");
    for (Question question in quiz.questions) {
      Answer? answer = submission.getAnswerFor(question.id);
      if (answer != null) {
        int score = question.getScore(answer);
        int total = question.points;
        print("\t- Question: " + question.title);
        print("\t- Score: " +
            score.toString() +
            "/" +
            total.toString() +
            " point");
        print("\n");
      }
    }
    print("\n");
  }
}

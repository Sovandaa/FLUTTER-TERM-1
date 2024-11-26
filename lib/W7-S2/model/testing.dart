import 'package:flutter_workspace/W7-S2/model/quiz.dart';
import 'package:flutter_workspace/W7-S2/model/submission.dart';

void main() {
  const List<Question> questions = [
    Question(
        title: "Who is the best teacher?",
        possibleAnswers: ["ronan", "hongly", 'leangsiv'],
        goodAnswer: "ronan"),
    Question(
        title: "Which color is the best?",
        possibleAnswers: ["blue", "red", 'green'],
        goodAnswer: 'red')
  ];

  Answer answerTest1 =
      Answer(userAnswer: 'ronan', question: questions.elementAt(0));

  Answer answerTest2 =
      Answer(userAnswer: 'blue', question: questions.elementAt(1));

  print('Is the answer test1 correct? ${answerTest1.isCorrect()}');
  print('Is the answer test2 correct? ${answerTest2.isCorrect()}');

  Submission userSubmission = Submission(answers: [answerTest1, answerTest2]);

  print("Submission Socre: ${userSubmission.getScore()}\n");
  for (var question in questions) {
    print(userSubmission.getAnswerFor(question));
  }
  
}

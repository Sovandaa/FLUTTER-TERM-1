
import 'model/app/app.dart';
import 'model/quiz/quiz.dart';
import 'model/submission/submission.dart';
import 'cli/quiz_cli.dart';
import 'package:uuid/uuid.dart';

main() {
   final uuid = Uuid();
   
  // 1- Create a demo quiz and submissions
  Quiz bestQuiz = Quiz(id:uuid.v4(), title: "great quiz");
  Question q1 = Question.singleChoice(
      id:uuid.v4(),
      title: "What is the color of the sky?",
      possibleChoices: ["blue", "red"],
      goodChoices: "blue");

  Question q2 = Question.singleChoice(
      id:uuid.v4(),
      title: "What is the best country oni the world?",
      possibleChoices: ["france", "cambodia"],
      goodChoices: "cambodia");

  Question q3 = Question.multipleChoice(
      id:uuid.v4(),
      title: "What is the best food ever ?",
      possibleChoices: ["pasta", "fish", "rice"],
      goodChoices: ["fish", "rice"]);

  bestQuiz.addQuestions([q1, q2, q3]);

  DateTime now = DateTime.now();
  Submision subRonan = Submision(quizId: bestQuiz.id, participant: "ronan", dateTime: now);
  subRonan.addAnswer(Answer(questionId: q1.id, selectedChoices: ["blue"]));
  subRonan.addAnswer(Answer(questionId: q2.id, selectedChoices: ["cambodia"]));
  subRonan.addAnswer(Answer(questionId: q3.id, selectedChoices: ["rice", "fish"]));

  Submision subHim = Submision(quizId: bestQuiz.id, participant: "him", dateTime: now);
  subHim.addAnswer(Answer(questionId: q1.id, selectedChoices: ["red"]));
  subHim.addAnswer(Answer(questionId: q2.id, selectedChoices: ["france"]));
  subHim.addAnswer(Answer(questionId: q3.id, selectedChoices: ["pasta"]));

  App myApp = App(quizzes:[bestQuiz], submissions:[subRonan, subHim]);
 

  // 2- Print the App status on CLI
  printApp(myApp);
  
}

 

import 'model/app/app.dart';
import 'model/quiz/quiz.dart';
import 'model/submission/submission.dart';
import 'cli/quiz_cli.dart';

main() {
 
  // 1- Create a demo quiz and submissions
  Quiz bestQuiz = Quiz(title: "great quiz");
  Question q1 = Question.singleChoice(
      title: "What is the color of the sky?",
      possibleChoices: ["blue", "red"],
      goodChoices: "blue");

  Question q2 = Question.singleChoice(
      title: "What is the best country oni the world?",
      possibleChoices: ["france", "cambodia"],
      goodChoices: "cambodia");

  Question q3 = Question.multipleChoice(
      title: "What is the best food ever ?",
      possibleChoices: ["pasta", "fish", "rice"],
      goodChoices: ["fish", "rice"]);

  bestQuiz.addQuestions([q1, q2, q3]);

  DateTime now = DateTime.now();
  Submision subRonan = Submision(quiz: bestQuiz, participant: "ronan", dateTime: now);
  subRonan.addAnswer(Answer(question: q1, selectedChoices: ["blue"]));
  subRonan.addAnswer(Answer(question: q2, selectedChoices: ["cambodia"]));
  subRonan.addAnswer(Answer(question: q3, selectedChoices: ["rice", "fish"]));

  Submision subHim = Submision(quiz: bestQuiz, participant: "him", dateTime: now);
  subHim.addAnswer(Answer(question: q1, selectedChoices: ["red"]));
  subHim.addAnswer(Answer(question: q2, selectedChoices: ["france"]));
  subHim.addAnswer(Answer(question: q3, selectedChoices: ["pasta"]));

  App myApp = App(quizzes:[bestQuiz], submissions:[subRonan, subHim]);
 

  // 2- Print the App status on CLI
  printApp(myApp);
  
}

 
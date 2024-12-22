import 'dart:io';

import 'package:my_quiz/model/app/app.dart';
import 'package:my_quiz/model/submission/submission.dart';
import 'package:my_quiz/repositories/quiz_app_repositories.dart';
import 'package:uuid/uuid.dart';

import 'model/quiz/quiz.dart';
 
File DATA_FILE = File('data.json');

void main() async {
  
  // 1 - Create app
  final uuid = Uuid();

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
 
  Submision subRonan = Submision(quizId: bestQuiz.id, participant: "ronan");
  subRonan.addAnswer(Answer(questionId: q1.id, selectedChoices: ["blue"]));
  subRonan.addAnswer(Answer(questionId: q2.id, selectedChoices: ["cambodia"]));
  subRonan.addAnswer(Answer(questionId: q3.id, selectedChoices: ["rice", "fish"]));

  Submision subHim = Submision(quizId: bestQuiz.id, participant: "him");
  subHim.addAnswer(Answer(questionId: q1.id, selectedChoices: ["red"]));
  subHim.addAnswer(Answer(questionId: q2.id, selectedChoices: ["france"]));
  subHim.addAnswer(Answer(questionId: q3.id, selectedChoices: ["pasta"]));

  App myApp = App(quizzes:[bestQuiz], submissions:[subRonan, subHim]);

  // 2 - Write app
  await writeQuizApp(DATA_FILE, myApp);

  // // 3 - Read app
  // myApp = await readQuizApp(DATA_FILE);

  // // 4 - Print app
  // myApp.printStatus();
}

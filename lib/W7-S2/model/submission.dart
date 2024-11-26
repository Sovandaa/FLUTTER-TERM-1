import 'package:flutter_workspace/W7-S2/model/quiz.dart';

class Answer {
  final Question question; 
  final String userAnswer;

  Answer({required this.userAnswer, required this.question});

  bool isCorrect() {
    return userAnswer == question.goodAnswer;
  }
}

class Submission {
  final List<Answer> answers;

  Submission({required this.answers});

  int getScore() {
    int scores = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        scores++;
      }
    }
    return scores;
  }

  Answer? getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.question == question) {
        return answer;
      }
    }
    return null;
  }

  void addAnswer(Question question, String answer) {
    for (var existAnswer in answers) {
      if (existAnswer.question == question) {
        return;
      }
    }
    answers.add(Answer(userAnswer: answer, question: question));
  }

  void removeAnswers() {
    answers.clear();
  }
}
import '../quiz/quiz.dart';

class Submision {
  final DateTime dateTime;
  final Quiz quiz;
  final String participant;

  final List<Answer> anwers;

  Submision({
    required this.participant,
    required this.quiz,
    required this.dateTime,
     List<Answer>? anwers,
  })  : anwers = anwers ?? [];

  void addAnswer( Answer answer) {
    anwers.add(answer);
  }

  Answer? getAnswerFor(Question question) {
    return anwers.firstWhere((a) => a.question == question);
  }
}

/// A participant answers for a specific question
class Answer {
  final Question question;
  final List<String> selectedChoices;

  Answer({required this.question, required this.selectedChoices});
}

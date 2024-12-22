import 'package:json/json.dart';

@JsonCodable()
class Submision {
  final String quizId;
  final String participant;
  final List<Answer> anwers;

  Submision({
    required this.participant,
    required this.quizId,
     List<Answer>? anwers,
  })  : anwers = anwers ?? [];

  void addAnswer( Answer answer) {
    anwers.add(answer);
  }

  Answer? getAnswerFor(String questionId) {
    return anwers.firstWhere((a) => a.questionId == questionId);
  }
}

/// A participant answers for a specific question
@JsonCodable()
class Answer {
  final String questionId;
  final List<String> selectedChoices;

  Answer({required this.questionId, required this.selectedChoices});
}

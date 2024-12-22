class Submision {
  final DateTime dateTime;
  final String quizId;
  final String participant;

  final List<Answer> anwers;

  Submision({
    required this.participant,
    required this.quizId,
    required this.dateTime,
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
class Answer {
  final String questionId;
  final List<String> selectedChoices;

  Answer({required this.questionId, required this.selectedChoices});
}

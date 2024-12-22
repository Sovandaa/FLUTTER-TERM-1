import '../submission/submission.dart';

class Quiz {
  final String id;
  final String title;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    List<Question>? questions,
  }) : questions = questions ?? [];

  void addQuestions(List<Question> newQuestions) {
    questions.addAll(newQuestions);
  }

  Question? getQuestionFor(String questionId) {
    return questions.firstWhere((q) => q.id == questionId);
  }

  ///
  /// Calculates the quiz total points
  ///
  int get points => questions.fold(0, (sum, question) => sum + question.points);
}

enum QuestionType { multipleChoice, singleChoice, freeAsnwer, code }

class Question {
  final String id;
  final QuestionType type;
  final String title;
  final List<String> possibleChoices;
  final List<String> goodChoices;

  int points = 1; // By default the question has 1 point

  Question(
      this.id, this.type, this.title, this.possibleChoices, this.goodChoices);

  Question.singleChoice({
    required String id,
    required String title,
    required List<String> possibleChoices,
    required String goodChoices,
  }) : this(id, QuestionType.singleChoice, title, possibleChoices,
            [goodChoices]);

  Question.multipleChoice({
    required String id,
    required String title,
    required List<String> possibleChoices,
    required List<String> goodChoices,
  }) : this(id, QuestionType.multipleChoice, title, possibleChoices,
            goodChoices);

  ///
  /// Calculates whether or not given answer is correct or not
  ///
  bool isCorrect(Answer answer) {
    return Set.from(answer.selectedChoices).containsAll(goodChoices) &&
        Set.from(goodChoices).containsAll(answer.selectedChoices);
  }

  ///
  /// Calculates the score for given ansnwer
  ///
  int getScore(Answer answer) {
    return isCorrect(answer) ? points : 0;
  }
}

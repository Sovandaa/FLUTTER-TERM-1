import '../submission/submission.dart';

class Quiz {

  final String title;
  final List<Question> questions;

  Quiz({
    required this.title, 
    List<Question>? questions, 
    }) : questions = questions ?? [];

  void addQuestions(List<Question> newQuestions) {
    questions.addAll(newQuestions);
  }

  ///
  /// Calculates the quiz total points
  ///
  int get points => questions.fold(0, (sum, question) => sum + question.points);

  ///
  /// Calculates the score for given submission
  ///
  int getScore(Submision submission) {
    if (submission.quiz != this) {
      throw Exception("This submission is related to another quiz");
    }

    int score = 0;
    for (Answer answer in submission.anwers) {
      Question question = answer.question;

      score += question.isCorrect(answer) ? question.points : 0;
    }
    return score;
  }
}

enum QuestionType { multipleChoice, singleChoice, freeAsnwer, code }

class Question {
  final QuestionType type;
  final String title;
  final List<String> possibleChoices;
  final List<String> goodChoices;

  int points = 1; // By default the question has 1 point

  Question(this.type, this.title, this.possibleChoices, this.goodChoices);

  Question.singleChoice({
    required String title,
    required List<String> possibleChoices,
    required String goodChoices,
  }) : this(QuestionType.singleChoice, title, possibleChoices, [goodChoices]);

  Question.multipleChoice({
    required String title,
    required List<String> possibleChoices,
    required List<String> goodChoices,
  }) : this(QuestionType.multipleChoice, title, possibleChoices, goodChoices);

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

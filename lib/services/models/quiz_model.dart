class QuizModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

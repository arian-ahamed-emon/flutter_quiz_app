import 'package:quiz_app/services/models/quiz_model.dart';

List<QuizModel> getMockQuizQuestions() {
  return [
    QuizModel(
      id: '1',
      question: 'What is the capital of France?',
      options: ['London', 'Paris', 'Rome', 'Berlin'],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      id: '2',
      question: 'What is 5 + 7?',
      options: ['10', '11', '12', '13'],
      correctAnswerIndex: 2,
    ),
    // Add more questions
  ];
}

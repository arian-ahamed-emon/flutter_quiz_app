import 'package:quiz_app/services/models/quiz_model.dart';

class SubCategoryModel {
  final String id;
  final String name;
  final List<QuizModel> quizzes;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.quizzes,
  });
}

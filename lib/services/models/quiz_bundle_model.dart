import 'package:quiz_app/services/models/sub_category_mode.dart';

class QuizBundleModel {
  final String id;
  final String title;
  final List<SubCategoryModel> subcategories;

  QuizBundleModel({
    required this.id,
    required this.title,
    required this.subcategories,
  });
}

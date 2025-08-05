import 'package:quiz_app/services/models/quiz_bundle_model.dart';
import 'package:quiz_app/services/models/quiz_model.dart';
import 'package:quiz_app/services/models/sub_category_mode.dart';

final dummyBundle = [
  QuizBundleModel(
    id: 'bundle1',
    title: 'Programing Bundle',
    subcategories: [
      SubCategoryModel(
        id: 'sub1',
        name: 'Programming Basic',
        quizzes: [
          QuizModel(
            id: 'q1',
            question:
                'Which of the following is a valid variable name in most languages?',
            options: ['2name', 'my-name', 'my_name', 'class'],
            correctAnswerIndex: 2,
          ),//

          QuizModel(
            id: 'q2',
            question:
                ' What symbol is used for comments in Python?',
            options: ['//', '#', '/* */', '--'],
            correctAnswerIndex: 0,
          ),
        ],
      ),
    ],
  ),
];

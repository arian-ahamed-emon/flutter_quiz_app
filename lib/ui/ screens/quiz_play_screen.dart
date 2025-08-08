import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:quiz_app/services/models/quiz_model.dart';
import 'package:quiz_app/ui/%20screens/quiz_result_screen.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

import '../widgets/quiz_help_button.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  final List<QuizModel> questions = [
    QuizModel(
      question: 'Which of the following is a programming language?',
      options: ['HTML', 'Python', 'CSS', 'SQL'],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      question: "What does “==” mean in most programming languages?",
      options: [
        'Assignment',
        'Equal to (comparison)',
        'Not equal to',
        'Increment',
      ],
      correctAnswerIndex: 1,
    ),
    QuizModel(
      question: "Which symbol is used for single-line comments in Python?",
      options: ['//', '<!-- -->', '#', '/* */'],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "Which data type stores decimal numbers in most languages?",
      options: ['int', 'string', 'float', 'bool'],
      correctAnswerIndex: 2,
    ),
    QuizModel(
      question: "In programming, what is a variable?",
      options: [
        'A fixed value',
        'A container for storing data',
        'A loop',
        'A function',
      ],
      correctAnswerIndex: 1,
    ),
  ];

  int currentIndex = 0;
  int score = 0;
  int? _selectedIndex;
  bool answered = false;

  Duration _timerDuration = const Duration(minutes: 5);
  Key _timerKey = UniqueKey();

  double _progress = 0.0;

  String get timerText {
    final secondsLeft = (_timerDuration.inSeconds * (1 - _progress)).ceil();
    return '00:${secondsLeft.toString().padLeft(3)}';
  }

  void checkAnswer(int index) {
    if (answered) return;

    setState(() {
      _selectedIndex = index;
      answered = true;
      if (index == questions[currentIndex].correctAnswerIndex) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (currentIndex < questions.length - 1) {
          currentIndex++;
          _selectedIndex = null;
          answered = false;
          _timerDuration = const Duration(minutes: 5);
          _timerKey = UniqueKey();
          _progress = 0.0;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuizResultScreen(score: score, total: questions.length),
            ),
          );
        }
      });
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Time is up!'),
        content: const Text('Do you want to add 30 more seconds?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _addExtraTime();
            },
            child: const Text('Add Time'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _skipQuestion();
            },
            child: const Text('Skip Question'),
          ),
        ],
      ),
    );
  }

  void _addExtraTime() {
    setState(() {
      _timerDuration = const Duration(minutes: 5);
      _timerKey = UniqueKey();
      _progress = 0.0;
    });
  }

  void _skipQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
        _selectedIndex = null;
        answered = false;
        _timerDuration = const Duration(minutes: 5);
        _timerKey = UniqueKey();
        _progress = 0.0;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                QuizResultScreen(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(115, 53, 226, 1.0),
        title: Text(
          'Question ${currentIndex + 1}/${questions.length}',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
      ),
      body: ScreenBackground(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 410,
                height: 850,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    buildQuestionBoxSection(question),
                    const SizedBox(height: 10),
                    buildTimerSection(),
                    buildOptionSection(question),
                    buildQuizHelpSection(),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestionBoxSection(QuizModel question) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(151, 95, 244, 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 270,
        width: 380,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              question.question,
              style: GoogleFonts.lato(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTimerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: LinearTimer(
              minHeight: 8,
              key: _timerKey,
              duration: _timerDuration,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange,
              onTimerEnd: () {
                _showTimeUpDialog();
              },
            ),
          ),
          const SizedBox(width: 5),
          Text(
            timerText,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildOptionSection(QuizModel question) {
    return Expanded(
      child: ListView.builder(
        itemCount: question.options.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final isCorrect = index == question.correctAnswerIndex;
          final isSelected = index == _selectedIndex;

          Color tileColor;
          if (answered) {
            if (isCorrect) {
              tileColor = Colors.greenAccent.shade100;
            } else if (isSelected && !isCorrect) {
              tileColor = Colors.redAccent.shade100;
            } else {
              tileColor = Colors.white;
            }
          } else {
            tileColor = Colors.white;
          }

          return GestureDetector(
            onTap: () => checkAnswer(index),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: isSelected ? 6 : 2,
              margin: const EdgeInsets.symmetric(vertical: 6),
              color: tileColor,
              child: ListTile(
                leading: Text(
                  '${String.fromCharCode(65 + index)}',
                  style: GoogleFonts.lato(fontSize: 20),
                ),
                title: Text(
                  question.options[index],
                  style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                ),
                trailing: answered
                    ? Icon(
                  isCorrect
                      ? Icons.done_rounded
                      : (isSelected ? Icons.close_rounded : null),
                  color: isCorrect
                      ? Colors.green
                      : (isSelected ? Colors.red : null),
                )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildQuizHelpSection() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuizHelpButton(
                        labelTop: '50/50',
                        labelBottom: 'Answer',
                        onTap: () {},
                      ),
                      const SizedBox(width: 5),
                      QuizHelpButton(
                        labelBottom: 'Audience',
                        icon: Icons.group,
                        onTap: () {},
                      ),
                      const SizedBox(width: 5),
                      QuizHelpButton(
                        labelBottom: 'Add Time',
                        icon: Icons.access_time_rounded,
                        onTap: _addExtraTime,
                      ),
                      const SizedBox(width: 5),
                      QuizHelpButton(
                        labelBottom: 'Skip',
                        icon: Icons.double_arrow,
                        onTap: _skipQuestion,
                      ),
                    ],
                  );
  }




}

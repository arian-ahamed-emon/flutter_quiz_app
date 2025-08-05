import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/services/models/quiz_bundle_model.dart';
import 'package:quiz_app/ui/%20screens/quiz_play_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key, required QuizBundleModel bundle});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> quizList = [
    {
      'title': 'Programming Basics',
      'amount': '15 Questions',
      'img': AssetPath.pgBasic,
    },
    {
      'title': 'Dart & Flutter Basics',
      'amount': '15 Questions',
      'img': AssetPath.flutterBasic,
    },
    {
      'title': 'OOP Concepts',
      'amount': '15 Questions',
      'img': AssetPath.oopLogo,
    },
    {
      'title': 'HTML/CSS Basics',
      'amount': '15 Questions',
      'img': AssetPath.htmlLogo,
    },
    {
      'title': 'Python Fundamentals',
      'amount': '15 Questions',
      'img': AssetPath.pythonLogo,
    },
  ];

  void _onStartQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPlayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(115, 53, 226, 1.0),
        title: Text('Programming', style: GoogleFonts.lato(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  if (_selectedIndex != null)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Selected: ${quizList[_selectedIndex!]['title']}",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: quizList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        final quiz = quizList[index];
                        final isSelected = _selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() => _selectedIndex = index);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.deepPurple.shade50
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.grey.shade300,
                                width: isSelected ? 3 : 1,
                              ),
                              boxShadow: isSelected
                                  ? [
                                BoxShadow(
                                  color: Colors.deepPurple.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(0, 6),
                                ),
                              ]
                                  : [],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: isSelected
                                      ? Colors.deepPurple
                                      : Colors.orange,
                                  child: ClipOval(
                                    child: Image.asset(
                                      quiz['img'],
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        quiz['title'],
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected
                                              ? Colors.deepPurple
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        quiz['amount'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.deepPurple.shade300
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_selectedIndex != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton.icon(
                onPressed: _onStartQuiz,
                icon: Icon(Icons.play_arrow, color: Colors.white),
                label: Text("Start Quiz", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

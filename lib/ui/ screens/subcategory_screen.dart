import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/quiz_play_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int? _selectedIndex;

  final List<Widget> _screens = [
    QuizPlayScreen(),
    QuizPlayScreen(),
    QuizPlayScreen(),
    QuizPlayScreen(),
    QuizPlayScreen(),
  ];

  final List<Map<String, dynamic>> quizList = [
    {
      'title': 'Programming Basics',
      'amount': '15 Questions',
      'img': AssetPath.pgBasic,
      'points': 50,
    },
    {
      'title': 'Dart & Flutter Basics',
      'amount': '15 Questions',
      'img': AssetPath.flutterBasic,
      'points': 50,
    },
    {
      'title': 'OOP Concepts',
      'amount': '15 Questions',
      'img': AssetPath.oopLogo,
      'points': 50,
    },
    {
      'title': 'HTML/CSS Basics',
      'amount': '15 Questions',
      'img': AssetPath.htmlLogo,
      'points': 50,
    },
    {
      'title': 'Python Fundamentals',
      'amount': '15 Questions',
      'img': AssetPath.pythonLogo,
      'points': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(115, 53, 226, 1.0),
        title: Text(
          'Programming',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                        final _quiz = quizList[index];
                        final isSelected = _selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.deepPurple.shade50
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: isSelected
                                  ? Border.all(
                                      color: Colors.deepPurple,
                                      width: 3,
                                    )
                                  : Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.deepPurple.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 10,
                                        offset: Offset(0, 6),
                                      ),
                                    ]
                                  : [],
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
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
                                      _quiz['img'],
                                      fit: BoxFit.cover,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _quiz['title'],
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: isSelected
                                              ? Colors.deepPurple
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        _quiz['amount'],
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _screens[_selectedIndex!],
                    ),
                  );
                },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Start Quiz", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

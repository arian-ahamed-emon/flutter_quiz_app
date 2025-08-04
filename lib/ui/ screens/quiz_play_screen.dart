import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

import '../utils/assets_path.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> quizList = [
    {'title': 'Programming    Basics'},
    {'title': 'Dart & Flutter Basics'},
    {'title': 'OOP Concepts'},
    {'title': 'HTML/CSS Basics'},
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String get timerText {
    final secondsLeft = (10 * (1 - _controller.value)).ceil();
    return '00:$secondsLeft';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(115, 53, 226, 1.0),
        title: Text(
          'Question 7/10',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
      ),
      body: ScreenBackground(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 410,
                height: 850,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(151, 95, 244, 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 270,
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Which soccer team won the FIFA World Cup for the first time?',
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
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Time',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return LinearProgressIndicator(
                                  value: _controller.value,
                                  minHeight: 8,
                                  backgroundColor: Colors.grey.shade400,
                                  color: Colors.orange,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 5),
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
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: isSelected
                                    ? BorderSide.none
                                    : BorderSide.none,
                              ),
                              elevation: isSelected ? 6 : 2,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              color: isSelected
                                  ? Colors.greenAccent.shade100
                                  : Colors.white,
                              child: ListTile(
                                leading: Text('${String.fromCharCode(65 + index)}',style: GoogleFonts.lato(fontSize: 20),),
                                title: Text(
                                  _quiz['title'],
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.black,
                                  ),
                                ),
                                trailing: Checkbox(
                                  value: isSelected,
                                  onChanged: (selected) {},
                                  shape: CircleBorder(),
                                  checkColor: Colors.white,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    buildBottomNavBar(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildBottomNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        SizedBox(
          height: 70,
          width: 90,
          child: Card(
            elevation: 4,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '50/50',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Answer',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
          height: 70,
          width: 90,
          child: Card(
            elevation: 4,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.group, color: Colors.white),
                  Text(
                    'Audience',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
          height: 70,
          width: 90,
          child: Card(
            elevation: 4,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.white),
                  Text(
                    'Add Time',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
          height: 70,
          width: 90,
          child: Card(
            elevation: 4,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.double_arrow, color: Colors.white),
                  Text(
                    'Skip',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

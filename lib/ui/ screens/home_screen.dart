import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/kids_quiz_screen.dart';
import 'package:quiz_app/ui/%20screens/programing_quiz_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _screens = [
    ProgramingQuizScreen(),
    KidsQuizScreen()
  ];

  List<Map<String, dynamic>> quizCategory = [
    {'title': 'Technology', 'img': AssetPath.tech},
    {'title': 'Science', 'img': AssetPath.seince},
    {'title': 'Entertainment', 'img': AssetPath.entertainment},
    {'title': 'Sports', 'img': AssetPath.sports},
    {'title': 'Travel', 'img': AssetPath.travel},
    {'title': 'General', 'img': AssetPath.general},
  ];

  List<Map<String,dynamic>> _quizList = [
    {'title': 'Programming Quiz','amount': '40+ Questions','img' : AssetPath.programingQuiz},
    {'title': 'Kids Quiz','amount': '15+ Questions','img' : AssetPath.kidsQuiz},
    {'title': 'General Knowledge Quiz','amount': '15+ Questions','img' : AssetPath.generalQuiz},
    {'title': 'Sports Quiz','amount': '20+ Questions','img' : AssetPath.sportsQuiz},
    {'title': 'Entertainment Quiz','amount': '13 Questions','img' : AssetPath.entertainmentQuiz},
    {'title': 'Seince Quiz','amount': '13 Questions','img' : AssetPath.seinceQuiz},
    {'title': 'Guess Who?','amount': '13 Questions','img' : AssetPath.guessQuiz},
  ];

  bool isFlashOn = false;

  void toggleSwitch() {
    setState(() {
      isFlashOn = !isFlashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildDailyTaskStatus(),
                const SizedBox(height: 20),
                HomeSectionHeader(title: 'Category', onTap: () {}),
                buildQuizCategorySection(),
                const SizedBox(height: 20),
                HomeSectionHeader(title: "More Quiz", onTap: () {}),
                buildMoreQuizSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDailyTaskStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurple.shade400,
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(AssetPath.dailyTaskImg, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Daily Task',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      child: const Icon(
                        Icons.people_alt_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '14 Questions',
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 9 / 14,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                    Text(
                      '9/14',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQuizCategorySection() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: quizCategory.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = quizCategory[index];
          return Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white10,
                  image: DecorationImage(
                    image: AssetImage(category['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category['title'],
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildMoreQuizSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: _quizList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final quizList = _quizList[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => _screens[index],));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        '${quizList['img']}',
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Spacer(),
                    Text(
                      '${quizList['title']}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${quizList['amount']}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '120k',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

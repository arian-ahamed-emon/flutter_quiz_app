import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFlashOn = false;

  void toggleSwitch() {
    setState(() {
      isFlashOn = !isFlashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              buildDalyTaskStatus(),
              SizedBox(height: 20),
              HomeSectionHeader(title: 'Quiz', onTap: () {}),
              buildQuizCategorySection(),
              HomeSectionHeader(title: "More Games", onTap: () {}),
              buildMoreGamesCategorySection(),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildMoreGamesCategorySection() {
    return  GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.85,
                ),
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AssetPath.signInLogo,
                              height: 155,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Tech Quiz',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "14 Question's",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.emoji_events,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '120k',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),

                              Container(
                                width: 35,
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
                  );
                },
            );
  }

  SizedBox buildQuizCategorySection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(AssetPath.signInLogo),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white30,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Title',
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildDalyTaskStatus() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white24,
      ),
      child: Row(
        children: [
          Container(
            width: 170,
            height: 160,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(AssetPath.profileImage, fit: BoxFit.cover),
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
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      child: const Icon(
                        Icons.people_alt_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  '14 Questions',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 26),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 9 / 14,
                    minHeight: 8,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Progress                                             9/14',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

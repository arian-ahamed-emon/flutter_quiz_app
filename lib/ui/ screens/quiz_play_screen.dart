
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/assets_path.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text('Play Quiz',style: GoogleFonts.lato(color: Colors.white),),
    ),
    backgroundColor: Colors.deepPurple,
    body: SingleChildScrollView(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemCount: 20,
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
      ),
    )
      );
    }
  }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/flutter_quiz.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class ProgramingQuizScreen extends StatefulWidget {
  const ProgramingQuizScreen({super.key});

  @override
  State<ProgramingQuizScreen> createState() => _ProgramingQuizScreenState();
}

class _ProgramingQuizScreenState extends State<ProgramingQuizScreen> {

  final List<Widget> _screens = [
    FlutterQuiz()
  ];

final List<Map<String,dynamic>> quizList = [
  {'title' : 'Programming Basics' , 'amount' : '15 Questions' , 'img' : AssetPath.signInLogo},
  {'title' : 'Programming Basics' , 'amount' : '15 Questions' , 'img' : AssetPath.signInLogo},
  {'title' : 'Programming Basics' , 'amount' : '15 Questions' , 'img' : AssetPath.signInLogo},
  {'title' : 'Programming Basics' , 'amount' : '15 Questions' , 'img' : AssetPath.signInLogo},
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        ),
      ),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          itemCount: quizList.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final _quiz = quizList[index];
            return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => _screens[index],));
                },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Image.asset(
                      _quiz['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    _quiz['title'],
                    style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(_quiz['amount']),
                  trailing: Text(
                    '${_quiz['points']}',
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                  tileColor: Colors.white,
                ),
              ),
            );
          },
                ),
        ),
      ),
    );
  }
}

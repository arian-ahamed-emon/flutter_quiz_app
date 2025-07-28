import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/splash_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        elevatedButtonTheme: _elevatedButtonThemeData(),
        inputDecorationTheme: _inputDecorationTheme(),
      ),
      home: SplashScreen(),
    );
  }
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(400, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
    filled: false,
    hintStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

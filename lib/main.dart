import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_options.dart';
import 'app.dart';

Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
  runApp(const QuizApp());
}



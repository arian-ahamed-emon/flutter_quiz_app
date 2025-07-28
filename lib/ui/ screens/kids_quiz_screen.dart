
import 'package:flutter/material.dart';

class KidsQuizScreen extends StatefulWidget {
  const KidsQuizScreen({super.key});

  @override
  State<KidsQuizScreen> createState() => _KidsQuizScreenState();
}

class _KidsQuizScreenState extends State<KidsQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kids'),
      ),
    );
  }
}

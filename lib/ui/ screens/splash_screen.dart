import 'package:flutter/material.dart';
import 'package:quiz_app/ui/%20screens/main_bottom_nav_bar_screen.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  void _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetPath.primaryLogo, height: 225, width: 300),
            ],
          ),
        ),
      ),
    );
  }
}

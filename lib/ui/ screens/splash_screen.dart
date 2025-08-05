import 'package:flutter/material.dart';
import 'package:quiz_app/ui/%20screens/quiz_play_screen.dart';
import 'package:quiz_app/ui/%20screens/quiz_result_screen.dart';
import 'package:quiz_app/ui/%20screens/subcategory_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    final currentUser = FirebaseAuth.instance.currentUser;

    if (isLoggedIn && currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainBottomNavBarScreen(),
        ),
      );
    }
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

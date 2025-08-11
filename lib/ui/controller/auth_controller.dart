import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ screens/sign_in_screen.dart';
import '../widgets/show_snack_bar_message.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      showSnackBarMessage(
        context,
        'Account created successfully!',
        backgroundColor: Colors.green.shade600,
        icon: Icons.check_circle_outline,
        iconColor: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBarMessage(
          context,
          'The password provided is too weak.',
          backgroundColor: Colors.red.shade600,
          icon: Icons.warning_amber_outlined,
          iconColor: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackBarMessage(
          context,
          'The account already exists for that email.',
          backgroundColor: Colors.red.shade600,
          icon: Icons.warning_amber_outlined,
          iconColor: Colors.white,
        );
      }
    } catch (_) {
      showSnackBarMessage(
        context,
        'Something went wrong.',
        backgroundColor: Colors.red.shade600,
        icon: Icons.error_outline,
        iconColor: Colors.white,
      );
    }
  }

  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        showSnackBarMessage(
          context,
          'Login successful!',
          backgroundColor: Colors.green,
          icon: Icons.check_circle_outline,
          iconColor: Colors.white,
        );
      } else {
        throw Exception("User not found");
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      if (email.isEmpty) {
        showSnackBarMessage(
          context,
          'Please enter your email address.',
          backgroundColor: Colors.orange.shade600,
          icon: Icons.info_outline,
          iconColor: Colors.white,
        );
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);

      showSnackBarMessage(
        context,
        'Password reset email sent to $email',
        backgroundColor: Colors.green.shade600,
        icon: Icons.check_circle_outline,
        iconColor: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        default:
          errorMessage = e.message ?? 'Something went wrong';
      }

      showSnackBarMessage(
        context,
        errorMessage,
        backgroundColor: Colors.red.shade600,
        icon: Icons.warning_amber_outlined,
        iconColor: Colors.white,
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
          (_) => false,
    );
  }



  }
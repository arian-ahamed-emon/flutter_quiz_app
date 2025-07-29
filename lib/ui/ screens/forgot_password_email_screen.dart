import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(Icons.lock_reset, size: 80, color: Colors.white),
                const SizedBox(height: 20),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your registered email address below. We’ll send you instructions to reset your password.',
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Email input
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.lato(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.lato(color: Colors.white70),
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value!)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Reset button
                ElevatedButton(
                  onPressed: _onResetTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Send Reset Link',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Back to Sign In
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Back to Sign In',
                    style: GoogleFonts.lato(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onResetTap() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Add actual reset logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link sent to your email.')),
      );
    }
  }
}

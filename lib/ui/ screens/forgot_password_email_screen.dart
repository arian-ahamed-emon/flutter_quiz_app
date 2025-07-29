import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/controller/auth_controller.dart';
import 'package:quiz_app/ui/widgets/centerd_circular_progress_indicator.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';
import 'package:quiz_app/ui/widgets/show_snack_bar_message.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;
  final AuthController _auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
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
                      style: GoogleFonts.lato(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

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

                    ElevatedButton(
                      onPressed: _inProgress ? null : _onResetTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _inProgress
                          ? CenterdCircularProgressIndicator()
                          : Text(
                              'Send Reset Link',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                    ),

                    const SizedBox(height: 30),
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
      ),
    );
  }

  void _onResetTap() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _inProgress = true;
      });
      try {
        await _auth.resetPassword(_emailController.text.trim(), context);
      } catch (e) {
        showSnackBarMessage(context, e.toString());
      } finally {
        setState(() {
          _inProgress = false;
        });
      }
    }
  }
}

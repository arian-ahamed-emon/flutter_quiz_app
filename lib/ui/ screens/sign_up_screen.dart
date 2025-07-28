import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final TextEditingController _fullNameTEController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(AssetPath.signInLogo, height: 100),
                const SizedBox(height: 16),
                Text(
                  'Create Account',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Full Name
                _buildInputField(
                  controller: _fullNameTEController,
                  icon: Icons.person,
                  hintText: 'Full Name',
                ),

                // Email
                _buildInputField(
                  controller: _emailTEController,
                  icon: Icons.email,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),

                // Password
                _buildInputField(
                  controller: _passwordTEController,
                  icon: Icons.lock,
                  hintText: 'Password',
                  isPassword: true,
                ),

                // Confirm Password
                _buildInputField(
                  controller: _confirmPasswordTEController,
                  icon: Icons.lock_outline,
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _onTapSignUp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.lato(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 📦 Reusable Input Field Builder
  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').isEmpty) {
            return 'Please enter your $hintText';
          }
          if (hintText == 'Confirm Password' &&
              _passwordTEController.text != controller.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        style: GoogleFonts.lato(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          hintText: hintText,
          hintStyle: GoogleFonts.lato(color: Colors.white70),
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Handle signup logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signing up...')),
      );
    }
  }
}

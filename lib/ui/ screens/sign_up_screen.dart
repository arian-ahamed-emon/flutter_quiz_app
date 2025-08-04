import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/controller/auth_controller.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/centerd_circular_progress_indicator.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';
import 'package:quiz_app/ui/widgets/show_snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
  TextEditingController();
  final TextEditingController _fullNameTEController = TextEditingController();
  final AuthController _auth = AuthController();
  bool _obscurePassword = true;
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBackground(
          child: Padding(
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

                  _buildInputField(
                    controller: _fullNameTEController,
                    icon: Icons.person,
                    hintText: 'Full Name',
                  ),

                  _buildInputField(
                    controller: _emailTEController,
                    icon: Icons.email,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),

                  _buildInputField(
                    controller: _passwordTEController,
                    icon: Icons.lock,
                    hintText: 'Password',
                    isPassword: true,
                  ),

                  _buildInputField(
                    controller: _confirmPasswordTEController,
                    icon: Icons.lock_outline,
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _inProgress ? null : _onTapSignUp,
                      child: _inProgress
                          ? CenterdCircularProgressIndicator()
                          : Text(
                        'Sign Up',
                        style: GoogleFonts.lato(
                          color: Colors.deepPurple,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 30),

              Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: GoogleFonts.lato(
                        color: Colors.black45,
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
              ]
            ),
          ),
        ),
      ),
      )
    );
  }

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

  void _onTapSignUp()  async{
    if (_formKey.currentState!.validate()) {
      setState(() {
        _inProgress = true;
      });
      try {
        await _auth.signUp(_emailTEController.text.trim(), _passwordTEController.text.trim(), context);

      } catch (e) {
        showSnackBarMessage(context, e.toString());
      } finally {
        _fullNameTEController.clear();
        _emailTEController.clear();
        _passwordTEController.clear();
        setState(() {
          _inProgress = false;
        });
      }
    }
  }
}

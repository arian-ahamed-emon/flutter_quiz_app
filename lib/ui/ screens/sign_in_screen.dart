import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/forgot_password_email_screen.dart';
import 'package:quiz_app/ui/%20screens/main_bottom_nav_bar_screen.dart';
import 'package:quiz_app/ui/%20screens/sign_up_screen.dart';
import 'package:quiz_app/ui/controller/auth_controller.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/centerd_circular_progress_indicator.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';
import 'package:quiz_app/ui/widgets/show_snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _obscurePassword = true;
  bool _inProgress = false;
  final AuthController _auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    'Welcome Back!',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),

                  _buildTextField(
                    controller: _emailTEController,
                    hint: 'Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => (val == null || val.isEmpty)
                        ? 'Please enter a valid email'
                        : null,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                    controller: _passwordTEController,
                    hint: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    suffix: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    validator: (val) => (val == null || val.isEmpty)
                        ? 'Please enter your password'
                        : null,
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _onTapForgotButton,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _inProgress ? null : _onTapSignInButton,
                      child: _inProgress
                          ?  CenterdCircularProgressIndicator()
                          : Text(
                              "Sign In",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.white70)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or continue with",
                          style: GoogleFonts.lato(color: Colors.white70),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.white70)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(AssetPath.googleLogo, _onTapGoogleSignIn),
                      const SizedBox(width: 16),
                      _socialButton(
                        AssetPath.facebookLogo,
                        _onTapFacebookSignIn,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  Text.rich(
                    TextSpan(
                      text: "Don't have an account?",
                      style: GoogleFonts.lato(color: Colors.white),
                      children: [
                        TextSpan(
                          text: " Sign Up",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpScreen(),
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    Widget? suffix,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.lato(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: GoogleFonts.lato(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      validator: validator,
    );
  }

  Widget _socialButton(String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22,
        child: Image.asset(asset, height: 22),
      ),
    );
  }

  void _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _inProgress = true;
      });

      try {
        await _auth.signIn(
          _emailTEController.text.trim(),
          _passwordTEController.text.trim(),
          context,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainBottomNavBarScreen()),
        );
      } catch (e) {
        showSnackBarMessage(context, e.toString());
      } finally {
        setState(() {
          _inProgress = false;
        });
      }
    }
  }



  void _onTapForgotButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordEmailScreen()),
    );
  }

  void _onTapGoogleSignIn() {}

  void _onTapFacebookSignIn() {}
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/main_bottom_nav_bar_screen.dart';
import 'package:quiz_app/ui/%20screens/sign_up_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 20),
                    Image.asset(AssetPath.signInLogo, height: 80, width: 120),
                    Text(
                      'Sign In',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          hintStyle: GoogleFonts.lato(color: Colors.white),
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordTEController,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                          hintStyle: GoogleFonts.lato(color: Colors.white),
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _onTapForgotButton,
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _onTapSignInButton,
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Colors.white, indent: 120),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.white, endIndent: 120),
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      children: [
                        IconButton(
                          onPressed: _onTapGoogleSignIn,
                          icon: Image.asset(AssetPath.googleLogo),
                        ),
                        IconButton(
                          onPressed: _onTapFacebookSignIn,
                          icon: Image.asset(AssetPath.facebookLogo),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: "Don't have an account?",
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
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
    );
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()),
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _onTapForgotButton() {}

  void _onTapGoogleSignIn() {}

  void _onTapFacebookSignIn() {}
}

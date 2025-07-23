import 'package:flutter/material.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body:  SingleChildScrollView(
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
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.person,color: Colors.white,)
                      ),
                      validator: (String?value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: Icon(Icons.person,color: Colors.white,)
                      ),
                      validator: (String?value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter a valid name';
                        }
                        return null;
                      },
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email,color: Colors.white,)
                      ),
                      validator: (String?value) {
                        if(value?.isEmpty ?? true){
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
                        prefixIcon: Icon(Icons.lock,color: Colors.white,),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.white,),
                      ),
                      validator: (String?value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter a valid password';
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
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock,color: Colors.white,),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.white,),
                      ),
                      validator: (String?value) {
                        if(value?.isEmpty ?? true){
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(onPressed: _onTapSignInButton, child: Text('Sign Up')),
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: _onTapSignInButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?",style: TextStyle(color: Colors.white,fontSize: 15),),
                   Text('Sign In',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),

    );
  }
  void _onTapSignInButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
  }void _onTapForgotButton(){

  }
}

// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:loca/screens/navbottom.dart';
import 'package:loca/screens/reset_password.dart';
import 'package:loca/screens/signup.dart';
import 'package:loca/screens/welcome/welcome.dart';
import 'package:loca/theme.dart';
import 'package:loca/widgets/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        toolbarHeight: 140,
        automaticallyImplyLeading: false,
        title:  IconButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30
          ),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Welcome()));
            }
        ),
        actions: [
          Container(
            padding:EdgeInsets.symmetric(horizontal: 30),

            child: Image(
              width: 120,
              image: AssetImage(
                'assets/images/logo.png'
              )
            )
          )
        ],
        backgroundColor: kBlue,
        shadowColor: kBlue.withOpacity(0)
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),

              Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              LogInForm(
                  emailContorller: emailController,
                  passwordContorller: passwordController),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('missing credentials')));
                  } else {
                    try {
                      CircularProgressIndicator();
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);

                      final user = userCredential.user;
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Wrong credentials')));
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CupertinoStoreHomePage(),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.code)));
                    }
                  }
                },
                child: Text('Sign In', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.orange),),
                height: 50,
                minWidth: 150,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'You don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        color: Color(0xFFFBC02D),
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                      
                    ),
                    
                  ),
                  SizedBox(
                    width: 0,
                  )
                ],
              )),
              SizedBox(
                height: 80,
              ),
              Center(
                  child: Column(
                children: <Widget>[
                  Text(
                    "© All rights reserved, LOCA 2021.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    "Check Policy Privacy.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

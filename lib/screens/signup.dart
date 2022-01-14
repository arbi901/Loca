// ignore_for_file: deprecated_member_use, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loca/screens/home/home.dart';
import 'package:loca/screens/login.dart';
import 'package:loca/screens/navbottom.dart';
import 'package:loca/theme.dart';
import 'package:loca/widgets/checkbox.dart';
import 'package:loca/widgets/primary_button.dart';
import 'package:loca/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordVerificationController =
        TextEditingController();
    return Scaffold(
      backgroundColor: kBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.white, fontSize: 32, fontFamily: 'Ubuntu'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Ubuntu'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          color: Colors.yellow),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: kDefaultPadding,
              child: SignUpForm(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
                passwordVerificationController: passwordVerificationController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: kDefaultPadding,
                child: Row(
                  children: <Widget>[
                    CheckBox(''),
                    Text(
                      'I agree all terms.',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FlatButton(
                color: Colors.yellow,
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('missing credentials')));
                  } else {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                      final user = userCredential.user;
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Wrong credentials')));
                      } else {
                        await FirebaseFirestore.instance.collection('usersDetails').add({
                          'firstName': firstNameController.text,
                          'lastName' : lastNameController.text,
                          'email' : emailController.text,
                          'phone' : phoneController.text,
                        });
                        Navigator.push(
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
                child: Text('Sign Up'),
                height: 50,
                minWidth: 150,
              ),
            ),
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
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors


////Autre sign 


import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(61,47,215, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(61,47,215, 1.0),
        toolbarHeight: 100,
        title: Text("Sign In"),
      ),

      body : SignInBody(),
    );
  }
}


class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \no\nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ignore_for_file: deprecated_member_use, unnecessary_new, non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loca/screens/login.dart';


class Welcome extends StatelessWidget {
  static String routeName = "/welcome";

  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(61,47,215, 1.0),
      resizeToAvoidBottomInset: false ,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/onboard.png',
                      width: 400,
                      height: 400,
                    ),
                    Text(
                      "Welcome to LOCA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.orange
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Are you seraching for home, or you are leaving your place and you want to rent it. You will find here what you need.",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 250, height: 50),
                      child: ElevatedButton(
                        child: Text(
                          "get started".toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2
                            ),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                               Color.fromRGBO(255, 45, 50, 1)),///Color(0xFFD91458)),///Colors.deepPurpleAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Color(0xFFD91458)))),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),

                    Text(
                     ' © All rights reserved, LOCA 2021',
                      style: TextStyle(color: Colors.white.withOpacity(0.7))
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    
                    
                    RichText(
                        text:
                      TextSpan(
                          text: 'Privacy policy',
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => {
                                  showAlertDialog(context)
                                },
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.55),
                            decoration: TextDecoration.underline
                            )),
  
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Pour donner les privacy policy:

showAlertDialog(BuildContext context) {
  Widget CloseButton = TextButton(
    child: Text("Close"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(
      "LOCA Privacy Policy",
      style: TextStyle(
        fontSize: 19,
        color: Color.fromRGBO(61,47,215, 1.0)
      ),
      ),
    content: Text(
      "LOCA is public and anounoucements are immediately viewable and searchable by anyone.When you use LOCA, even if you’re just looking at announcements, we receive some personal information from you like the type of device you’re using and your IP address.",
      style: TextStyle(
        fontSize: 17,
        color: Colors.black.withOpacity(0.8)
      ),
      ),
    actions: [
      CloseButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

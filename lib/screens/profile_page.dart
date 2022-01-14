
// ignore_for_file: deprecated_member_use, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loca/screens/login.dart';
import 'package:loca/theme.dart';


class Profile extends StatefulWidget {
  
  const Profile({ Key? key }) : super(key: key);
  static String id="profile";
  

  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white.withOpacity(0),
        actions: [
          FlatButton(
            child: Row(children: [
            Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red
              ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
              SizedBox(width: 5)
            
            
          ],),
          onPressed: (){
            FirebaseAuth.instance.signOut();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => LogInScreen(),
              //   ),
              // );
            }
          ),
        ],
      ),

      body: SingleChildScrollView(
        child:Center(
          child: Column(children: [
            SizedBox(
              height: 25
            ),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(
              height: 25
            ),
            SizedBox(
              height: 110,
              width: 110,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                CircleAvatar(
                backgroundImage: AssetImage("assets/images/default_user.jpg"),
              ),
                Positioned(
                  right: -9,
                  bottom: 5,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: kBlue,
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        ),
                      ),
                    ),)
                  ],
                ),
              ),
            SizedBox(
              height: 15,
            ),
            Text(
              "User Name",
              style: TextStyle(
                fontSize: 31
              ),

            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "example@example.com",
              style:TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5)
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "University",
              style:TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5)
              ),
              ),
              SizedBox(height: 12),
              Container(
                height: 40,
                width: 90,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20)
                  )
                ),
                
                child: Text(
                  "0 Posts",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  ),
              ),

              SizedBox(
                height: 45
              ),
              
              
              Container(
                height: 10,
                width: 6000,
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  SizedBox(width: 20,),
                  Text(
                      "My announcements :",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                  SizedBox(width: 10)               
                ],
              ),
              SizedBox(
                height:30
              ),

              Center(
                child: Text(
                  "There is no post for the moment",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.85)
                  ),
                ),
              ),
              SizedBox(height: 30)


          ],)


        ),)
    );
  }
}


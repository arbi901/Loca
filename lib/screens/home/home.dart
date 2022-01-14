// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:loca/favorties.dart';
import 'package:loca/screens/home/components/body.dart';




class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      appBar: buildAppBar(),
      body: Body(),
      

      //-----------------------------------Drawer-----------------------------------------
      drawer: Drawer(
        child: Container(
          width: size.width,
          height: size.height * 1.2,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 55, 90)),
          child: Column(
            children: [
              //--------------------LOGO--------------------
              DrawerHeader(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    alignment: Alignment.centerLeft,
                    image: AssetImage('images/loca_form.png'),
                    height: size.height * 0.15,
                    width: size.width * 0.45,
                  ),
                ),
              ),

              //---------------------Home button----------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 32),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: const Text('Home'),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),

              //--------------Notifications button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 32),
                ),
                onPressed: () {},
                child: const Text('Notifications'),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),

              //--------------Favorites button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 32),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorty()));
                },
                child: const Text('Favorites'),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),

              //--------------Help button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 32),
                ),
                onPressed: () {},
                child: const Text('Help'),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),

              //--------------------------------
              const Text(
                '© All rights reserved, LOCA 2021',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Text(
                'Privacy policy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor:  Color(0xFED91458),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg",
        color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}




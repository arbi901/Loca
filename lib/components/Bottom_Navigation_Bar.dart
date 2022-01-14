// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loca/screens/Details.dart';
import 'package:loca/screens/form.dart';
import 'package:loca/screens/home/home.dart';
import 'package:loca/screens/profile_page.dart';
import 'package:loca/favorties.dart';

import '../enums.dart';

const kPrimaryColor = Color(0xFFD91458);

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Colors.black.withOpacity(0.9);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Color.fromRGBO(253, 253, 253, 1),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 60,
            color: Color(0xFFDADADA).withOpacity(1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    {
                      Navigator.pushNamed(context, HomeScreen.routeName)
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorty()))
                    }
              ),

              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor, 
                ),
                onPressed: () =>
                    {
                      // Navigator.pushNamed(context, HomeScreen.routeName)
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorty()))
                    },
              ),

              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add.svg",
                  color: kPrimaryColor,
                  width: 200,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyForm.id);
  
                },
              ),




              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  color: MenuState.notification == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                },
              ),

              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/user.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Profile.id),
              ),
            ],
          )),
    );
  }
}




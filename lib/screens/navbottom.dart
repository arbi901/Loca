// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loca/favorties.dart';
import 'package:loca/screens/Notifications.dart';
import 'package:loca/screens/form.dart';
import 'package:loca/screens/home/home.dart';
import 'package:loca/screens/profile_page.dart';


class CupertinoStoreHomePage extends StatelessWidget {
  const CupertinoStoreHomePage({ Key? key }) : super(key: key);
  static String routeName="/cust";
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: Colors.pink,size: 46,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Favorty(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MyForm(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Notifications(),
              );
            });
          default: return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child:Profile(),
              );
            });
        }
      },
    );
  }
}
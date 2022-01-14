
import 'package:flutter/widgets.dart';
import 'package:loca/screens/Details.dart';
import 'package:loca/screens/Notifications.dart';
import 'package:loca/screens/form.dart';
import 'package:loca/screens/home/home.dart';
import 'package:loca/screens/navbottom.dart';
import 'package:loca/screens/profile_page.dart';
import 'package:loca/screens/welcome/welcome.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  HomeScreen.routeName: (context) => HomeScreen(),
  Welcome.routeName: (context) => Welcome(),
  MyForm.id: (context) => MyForm(),
  Profile.id: (context) => Profile(),
  Details.id: (context) => Details(),
  Details.routName: (context) => Details(),
  Notifications.routeName: (context) => Notifications(),
  CupertinoStoreHomePage.routeName: (context) => CupertinoStoreHomePage()
};
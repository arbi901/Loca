// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:loca/routes.dart';
import 'package:loca/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
///import 'screens/welcome/welcome.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, /* Pour enlever debug icon dans le haut */
      title: 'Loca App',
      theme: ThemeData(
        fontFamily: 'Ubuntu', /// Font family
      ),
      initialRoute: "/welcome",
      routes: routes,
    );
  }
}



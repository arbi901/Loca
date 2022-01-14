// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);
  static String routeName="/notifications";

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 77, 110),
        title: Text("Notifications"),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.menu_rounded))
        ],
      ),

      body: Card(
              margin: EdgeInsets.only(left: 10, top: 30.0, right: 10.0),
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ 
                            Text("03:59 AM", style: TextStyle(color: Colors.grey ,fontSize: 15),textAlign: TextAlign.right,),
                            SizedBox(height: 10)
                          ]),
                        Text("The house which you liked has been rent ! :(",style: TextStyle(fontSize: 20),)
                      ]
        ))))


      
    );
  }
}
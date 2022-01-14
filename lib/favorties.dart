// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loca/components/Bottom_Navigation_Bar.dart';
import 'package:loca/enums.dart';
import 'package:loca/models/house.dart';
import 'package:loca/screens/home/home.dart';

class Favorty extends StatefulWidget {
  const Favorty({Key? key}) : super(key: key);

  @override
  _FavortyState createState() => _FavortyState();
}

class _FavortyState extends State<Favorty> {
  final housesCollection = FirebaseFirestore.instance.collection('housesInfo');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: housesCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }
            List<QueryDocumentSnapshot> housesDocuments = snapshot.data!.docs;
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: size.width * 0.01), 
              itemCount: housesDocuments.length,
              itemBuilder: (context, index) => buildOfferCard(House(type: housesDocuments[index]['type'], rooms: housesDocuments[index]['rooms'], price: housesDocuments[index]['price'], rating: housesDocuments[index]['rating'], date: housesDocuments[index]['date'], address: housesDocuments[index]['address'], description: housesDocuments[index]['description'], municipality: housesDocuments[index]['municipality'], region: housesDocuments[index]['region'], )), 
              
            );
          }
        ),
      ),


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

  Card buildOfferCard(House house) {
    return Card(
              margin: EdgeInsets.only(left: 10, top: 30.0, right: 10.0),
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        //-------------------image--------------------
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
                          child: Image(
                            image: AssetImage('assets/images/house_1.1.png'),
                            width: 130.0,
                          ),
                        ),
    
          //--------------villa--S+4--availablety--------------
    
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      children: [
                                        Text(house.type,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                decorationThickness: 5.0,
                                                fontWeight: FontWeight.bold)
                                                ),
                                        Text(
                                          'S+${house.rooms.round()}',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Available from:',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          house.date,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                          child: TextButton(
                                              onPressed: () {
                                                ///Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                                                
                                              },
                                              child: Text(
                                                'See More',
                                              
                                                style: TextStyle(
                                                  color: Colors.pink,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                        //-----prix--icon ----------------
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 0.0, bottom: 20.0),
                                          child: Text('${house.price}DT',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  decorationThickness: 5.0,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                          size: 45.0,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
              //-----------------Note-------------
                              Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    child: Text(
                                      '  Note:  ',
                                      style: TextStyle(
                                        backgroundColor: Colors.blue[900],
                                        color: Colors.white,
                                        decorationThickness: 5.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left:20.0),
                                    child: RatingBar.builder(
                                      initialRating: house.rating *1.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        size:2.0,
                                        color: Colors.amber,
                                       ),
                                      onRatingUpdate: (rating) {
                                       },
                                      ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              elevation: 5.0
              );
  }
}

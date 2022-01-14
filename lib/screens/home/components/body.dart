// ignore_for_file: use_key_in_widget_constructors, unused_import, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loca/constants.dart';
import 'package:loca/models/house.dart';
import 'package:loca/screens/Details.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
    final housesCollection = FirebaseFirestore.instance.collection('housesInfo');

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "All", press: () {}),
          StreamBuilder<QuerySnapshot>(
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
              itemBuilder: (context, index) => GestureDetector(child:buildOfferCard(House(type: housesDocuments[index]['type'], rooms: housesDocuments[index]['rooms'], price: housesDocuments[index]['price'], rating: housesDocuments[index]['rating'], date: housesDocuments[index]['date'], address: housesDocuments[index]['address'], description: housesDocuments[index]['description'], municipality: housesDocuments[index]['municipality'], region: housesDocuments[index]['region'])),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details()));
                },
              )
                    
            );
          }
        ),
          SizedBox(height: kDefaultPadding),
        ],
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
    
          //--------------villa--S+x--availablety--------------
    
                        Container(
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            fontSize: 13.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          house.date,
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                        ),
                                      ],
                                    ),
                                  ),
                        //-----prix--icon ----------------
                                  SizedBox(
                                    width: 5,
                                  ),
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
                                        
                                      ],
                                    ),
                                  )
                                ],
                              ), ///FirebaseAuth.instance.signOut()
              //-----------------Note-------------
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
///FirebaseAuth.instance.signOut()
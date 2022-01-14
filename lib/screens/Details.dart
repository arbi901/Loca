// ignore_for_file: file_names, sized_box_for_whitespace, unused_local_variable, type_init_formals
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loca/models/house.dart';
import 'package:loca/screens/house_image.dart';



List<String> images = [
    "assets/images/house_1.1.png",
    "assets/images/house_2.png",
    "assets/images/house_3.png",
    "assets/images/house_4.png",
    "assets/images/house_4.png"
];

class Details extends StatefulWidget {
  const Details({ 
    Key? key,
    }) : super(key: key);
    static String id = "Details";
    static String routName='/details';

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 77, 110),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu_rounded))
        ],
      ),

      body: SingleChildScrollView(
        child:Column(children: [
          HouseImages(images: images),
          Container(
          
          margin: EdgeInsets.only(top:20),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal:40),
      
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      SizedBox(height: 10),    
                      Text(
                        "Studio",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      
                      SizedBox(height: 6),
                      Text(
                        'S+1',
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                        
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                      
                    }, 
                    icon: SvgPicture.asset(
                      "assets/icons/heart.svg"
                    )
                  )
                ],
              ),
              SizedBox(height: 5),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Available from : 14-11-2021", style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text("4.5", style: TextStyle(fontSize: 18)),
                        SizedBox(width: 2),
                        Icon(Icons.star, color: Colors.yellow,)
                      ],
                    ),
                  )
                ],
              ),

              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Spacious house in a very calm neighborhood. It s close to all commadities including a supermarket and a gym. The owner is nice. I highly recommand it. Slight problem withe kitchen sing but easily repairable"
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Adresse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                child: Text("25 Rue Ennasim,Ariana"),
                height: 20,
              ),
              SizedBox(
                height: 50,
              )
              ,
              Text(
                "Price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                child: Text("500 DT"),
                height: 20,
              ),
              SizedBox(
                height: 80,
              )

            ],
          ),
        ),
        ]))

    );
  }
}


class HouseDetailsArguments {
  final House house;

  HouseDetailsArguments({required this.house});
}
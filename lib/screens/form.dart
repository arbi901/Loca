// ignore_for_file: prefer_final_fields, unused_field
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loca/favorties.dart';
import 'package:loca/screens/home/home.dart';



class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);
  static String id = 'form';

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final CollectionReference houseInfoCollection = FirebaseFirestore.instance.collection('housesInfo');
  //--------------------Controllers-------------------------
  final TextEditingController _areaField = TextEditingController();
  final TextEditingController _priceField = TextEditingController();
  final TextEditingController _adressField = TextEditingController();
  final TextEditingController _descriptionField = TextEditingController();
  final TextEditingController _dateField = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  String? rating;
  String? municipality;
  String? region;
  String? type;
  double roomNbr = 0;
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //-----------------------------------Arrière plan rose---------------------------
      backgroundColor: const Color.fromARGB(255, 239, 77, 110),

      //-----------------------App Bar-----------------------------------
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 239, 77, 110),
        
      ),

      body: SingleChildScrollView(
        //----------------------Partie en gris-------------------------
        child: Container(
          width: size.width,
          height: size.height * 1.2,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
          ),

          //---------------------Partie en blanc--------------------------
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    top: size.width * 0.12,
                    right: size.width * 0.03,
                    bottom: size.width * 0.03),
                //horizontal: size.width * 0.03, vertical: size.width * 0.12),

                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 1.2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),

                  //----------------------------Le formulaire-----------------------------------
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.width * 0.2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                //--------------------choose a type (villa, studio, appartment)---------------------------
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    DropdownButtonFormField(
                                      onChanged:(String? value) => type = value,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      hint: const Text('Choose a type'),
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text('appartment'),
                                          value: 'appartment',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('villa'),
                                          value: 'villa',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('studio'),
                                          value: 'studio',
                                        )
                                      ],
                                    ),

                                    //------------------------------Region--------------------------
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    DropdownButtonFormField(
                                      onChanged:(String? value) => region = value,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      hint: const Text('Region'),
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text('Ariana'),
                                          value: 'Ariana',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('Tunis'),
                                          value: 'Tunis',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('Manouba'),
                                          value: 'Manouba',
                                        )
                                      ],
                                    ),

                                    //------------------------------Surface--------------------------
                                    const Text('*',
                                        style: TextStyle(color: Colors.red)),
                                    TextFormField(
                                      controller: _areaField,
                                      decoration: const InputDecoration(
                                        hintText: 'Area (m^2)',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),

                                    //-----------------------------Price----------------------------
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    TextFormField(
                                      controller: _priceField,
                                      decoration: const InputDecoration(
                                        hintText: 'Price',
                                        border: OutlineInputBorder(),
                                        suffixText: 'DT',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: size.width * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //----------------------------Rating---------------------------------
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    DropdownButtonFormField(
                                      onChanged:(String? value) => rating = value,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      hint: const Text('Rating'),
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text('0'),
                                          value: '0',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('1'),
                                          value: '1',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('2'),
                                          value: '2',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('3'),
                                          value: '3',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('4'),
                                          value: '4',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('5'),
                                          value: '5',
                                        )
                                      ],
                                    ),

                                    //---------------------------Municipality-------------------------
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    DropdownButtonFormField(
                                      onChanged:(String? value) => municipality = value,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      hint: const Text('Municipality'),
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text('Ghazela'),
                                          value: 'Ghazela',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('Ariana Soghra'),
                                          value: 'Ariana Soghra',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('Nkhilet'),
                                          value: 'Nkhilet',
                                        )
                                      ],
                                    ),

                                    //-----------------------S+---------------------------------
                                    const Text('*',
                                        style: TextStyle(color: Colors.red)),
                                    SpinBox(
                                      min: 0,
                                      value: 0,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'S+',
                                        labelStyle: TextStyle(fontSize: 30.0),
                                      ),
                                      onChanged: (value) => roomNbr = value,
                                    ),

                                    //----------------------------------Available from-------------------
                                    const Text(
                                      '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    TextFormField(
                                      controller: _dateField,
                                      decoration: const InputDecoration(
                                        hintText: 'Available from',
                                        suffixIcon: Icon(Icons.calendar_today),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          //------------------------------Address----------------------------------
                          const Text('*', style: TextStyle(color: Colors.red)),
                          TextFormField(
                            controller: _adressField,
                            decoration: const InputDecoration(
                              hintText: 'The address',
                              border: OutlineInputBorder(),
                            ),
                          ),

                          //-------------------------Description-------------------------------------
                          const Text('*', style: TextStyle(color: Colors.red)),
                          TextFormField(
                            controller: _descriptionField,
                            minLines: 1,
                            maxLines: 10,
                            style: const TextStyle(fontSize: 18.0),
                            decoration: const InputDecoration(
                              hintText: 'description',
                              border: OutlineInputBorder(),
                            ),
                          ),

                          //-----------------------------Images------------------------------------
                          const Text('*', style: TextStyle(color: Colors.red)),
                          Container(
                            width: size.width * 0.9,
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                                child: pickedFile == null ? IconButton(
                                  icon: Icon(Icons.image,
                                    size: size.width * 0.15,
                                    color: Colors.grey),
                                    onPressed: () async {
                                      final _pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                                      if (_pickedImage == null) return;
                                      setState(() => pickedFile = File(_pickedImage.path));
                                      // setState(() {
                                      //   pickedFile = _pickedImage;
                                      // });
                                    },) : GestureDetector(child: Image.file(pickedFile!, fit: BoxFit.cover,), onTap: () async {
                                      final _pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                                      if (_pickedImage == null) return;
                                      setState(() => pickedFile = File(_pickedImage.path));},),
                                    // ) : Image.file(File(pickedFile!.path), fit: BoxFit.fill)
                                    
                                    ),
                          ),

                          const Text('* : must fill',
                              style: TextStyle(color: Colors.red)),

                          //-----------------------------Cancel-button--------------------
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 239, 77, 110),
                                )),
                                onPressed: () {
                                  
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Cancel'),
                                ),
                              ),

                              //--------------------------Submit-button------------------
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 142, 140, 195),
                                )),
                                onPressed: () async {
                                  if(type == null || rating == null || region == null || municipality == null || 
                                  _areaField.text.isEmpty || _descriptionField.text.isEmpty || _adressField.text.isEmpty || _priceField.text.isEmpty || _dateField.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Some required fields are still empty')));
                                  } else {
                                    await houseInfoCollection.add({
                                      'type': type,
                                      'rating': num.parse(rating!),
                                      'region':region,
                                      'municipality':municipality,
                                      'area': _areaField.text,
                                      'rooms': roomNbr,
                                      'price': num.parse(_priceField.text),
                                      'date': _dateField.text,
                                      'address': _adressField.text,
                                      'description': _descriptionField.text,
                                    }
                                    );
                                  }

                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Submit'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //-------------------------------le rectangle contenant "New announcement"---------------------------
              Positioned(
                top: size.width * 0.05,
                left: size.width * 0.1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.05,
                      horizontal: size.width * 0.03),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 71, 78, 161),
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 4.0)
                      ]),
                  child: const Text(
                    'New announcement',
                    style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //----------------------------Drawer-------------------------------
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
                  alignment: Alignment.topCenter,
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage('assets/images/locaa.png'),
                    height: size.height * 0.15,
                    width: size.width * 0.45,
                  ),
                ),
              ),

              //---------------------Home button----------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: const Text('Home'),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),

              //--------------Notifications button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {},
                child: const Text('Notifications'),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),

              //--------------Favorites button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  ////Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorty()));
                },
                child: const Text('Favorites'),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),

              //--------------Help button---------------------
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
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
}

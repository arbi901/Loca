import 'package:flutter/material.dart';
import 'package:loca/theme.dart';

import '../../../constants.dart';


class HouseImages extends StatefulWidget {
  const HouseImages({
    Key? key,
    required this.images,
    
  }) : super(key: key);

  final List<String> images;

  @override
  _HouseImagesState createState() => _HouseImagesState();
}

class _HouseImagesState extends State<HouseImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 230,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.images.toString(),
              child: Image.asset(widget.images[selectedImage]),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        ))
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kBlue.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.images[index]),
      ),
    );
  }
}

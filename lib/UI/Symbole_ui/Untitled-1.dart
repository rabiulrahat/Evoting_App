import 'dart:math';
import 'package:flutter/material.dart';

var p = 1;

// main method with runapp runs the class A4Run
void main() => runApp(A4Run());

class A4Run extends StatefulWidget {
  A4Run({Key? key}) : super(key: key);

  @override
  A4RunState createState() => A4RunState();
}

class A4RunState extends State<A4Run> {
// list of images
  var listOfString = [
    "one",
    "two",
    "three",
  ];

// list of images
  var listImages = [
    "1.png",
    "two-image.jpg",
    "three-image.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    var stringsList = listOfString[p++];
    var selectedImage =
        listImages[listOfString.indexWhere((val) => val == stringsList)];

    // MaterialApp with debugShowCheckedModeBanner false
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.image),
              title: Text("Dynamic Add Image List"),
            ),
            body: Padding(
              padding: EdgeInsets.all(12.0),
              // list view to show images and list count
              child: ListView(scrollDirection: Axis.vertical, children: [
                Row(
                  children: [
                    // showing list of images
                    Image(image: AssetImage("assets/images/$selectedImage")),
                    // for (item in imgList)
                    //   Center(
                    //     child: Container(width: 200, height: 150, child: item),
                    //   )
                  ],
                ),
              ]),
            )));
  }
}

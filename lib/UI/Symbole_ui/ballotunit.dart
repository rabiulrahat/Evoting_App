import 'dart:math';
import 'package:demo_app2/DataModels/Datamode_candidate.dart';
import 'package:demo_app2/UI/Symbole_ui/votepass.dart';
import 'package:flutter/material.dart';

import '../../ApiServices/Getservice/get_candidate_service.dart';

var citeam;

class candidate extends StatefulWidget {
  candidate({Key? key}) : super(key: key);
  late Future<CandidateList?> candidateList;
  @override
  void initState() {
    candidateList = voter_get().getdata();
  }

  @override
  candidateState createState() => candidateState();
}

class candidateState extends State<candidate> {
  @override
  late List candit;
  late String selected = "-1";
  @override
  Widget build(BuildContext context) {
    // count of the list of image
    // late var ImgCount = candit.length;

    // MaterialApp with debugShowCheckedModeBanner false
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.image),
          title: const Text("Candidate List"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          // list view to show images and list count
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // showing list of images
              FutureBuilder(
                future: voter_get().getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.applicableCandidate;
                    candit = data;
                    print(candit);
                    return Container(
                      child: Column(
                        children: [
                          for (String item in candit)
                            SizedBox(
                                width: 200,
                                height: 200,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      print(item);
                                      setState(() {
                                        selected = item;
                                      });
                                      print("tapped" + item.toString());
                                      citeam = item;
                                      color:
                                      Colors.blueAccent;
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             passvote()));
                                    },
                                    splashColor:selected == item.toString()? Color.fromARGB(255, 255, 0,
                                         0):Color.fromARGB(255, 73, 255, 7), // Splash color over image
                                    // S
                                    //plash color over image
                                    child: Material(
                                      color:selected == item.toString()? Color.fromARGB(255, 255, 117, 37):Colors.white,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        child: Card(
                                          color: Color.fromARGB(255, 228, 201, 161),
                                          child: SizedBox(
                                            child: Image.asset(
                                                fit: BoxFit.fitWidth,
                                                'assets/images/$item.png',
                                                width: 50.0,
                                                height: 50.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
              Row(
                mainAxisAlignment : MainAxisAlignment.end,
                children: [
                  MaterialButton(
                                minWidth: double.minPositive,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // color: Colors.yellow,
                                color: Color.fromARGB(255, 255, 30, 30),
                                textColor: Color.fromARGB(255, 245, 241, 241),
                                disabledColor: Colors.black12,
                                disabledTextColor: Colors.black26,
                                padding: const EdgeInsets.all(21.0),
                                splashColor: Color.fromARGB(255, 170, 0, 0),
                                elevation: 5.0,
                                onPressed: () {
                                Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      passvote()));
                                },
                                child: const Text(
                                  "Press The button",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ),
                ],
              ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

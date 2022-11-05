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
  @override
  Widget build(BuildContext context) {
    // count of the list of image
    // late var ImgCount = candit.length;

    // MaterialApp with debugShowCheckedModeBanner false
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.image),
          title: Text("Image List"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
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
                            Center(
                                child: Container(
                                    width: 400,
                                    height: 400,
                                    child: Material(
                                      child: InkWell(
                                        onTap: ()  {
                                          // print(item);
                                          citeam = item;
                                          Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => passvote()));

                                        },
                                        splashColor: Color.fromARGB(255, 255, 0,
                                            0), // Splash color over image

                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          child: Image.asset(
                                              fit: BoxFit.fitWidth,
                                              'assets/images/$item.png',
                                              width: 110.0,
                                              height: 110.0),
                                        ),

                                      ),

                                    )


                                    // child: InkWell(
                                    //   onTap: () {},
                                    //   child: Ink.image(
                                    //     width: 110,
                                    //     height: 110,
                                    //   ),
                                    // )
                                    )),
                        ],
                      ),
                    );
                    // return Text(snapshot.data!.applicableCandidate[0]);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
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

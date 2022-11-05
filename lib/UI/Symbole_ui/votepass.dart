import 'package:demo_app2/ApiServices/Postservice/requestStatus.dart';
import 'package:demo_app2/ApiServices/Postservice/vote_cast_api_service.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:flutter/material.dart';

class passvote extends StatefulWidget {
  const passvote({super.key});

  @override
  State<passvote> createState() => _passvoteState();
}

class _passvoteState extends State<passvote> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
            child: ListView(children: [
          Column(
            children: [
              Image.asset('assets/images/$citeam.png',
                  width: 400.0, height: 400.0),
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 400,
                  ),
                  MaterialButton(
                    minWidth: double.minPositive,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: Colors.yellow,
                    color: Color.fromARGB(255, 49, 250, 86),
                    textColor: Color.fromARGB(255, 245, 241, 241),
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: const EdgeInsets.all(21.0),
                    splashColor: Color.fromARGB(255, 170, 0, 0),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.of(context).pop(
                          MaterialPageRoute(builder: (context) => candidate()));
                    },
                    child: const Text(
                      "Press For Back",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                  ),
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
                      vote_cast();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => requestStatus(),
                          ));
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => votepass()));
                    },
                    child: const Text(
                      "Press For Confirm Vote",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          )
        ])),
      ),
    );
  }
}

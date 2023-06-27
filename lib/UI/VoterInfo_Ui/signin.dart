import 'package:demo_app2/ApiServices/Getservice/get_candidate_service.dart';
import 'package:demo_app2/ApiServices/Getservice/voter_verify.dart';
import 'package:demo_app2/ApiServices/Postservice/reqstatus/voter_verify_status.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/homepage.dart';
import 'package:demo_app2/main.dart';
import 'package:flutter/material.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/header.dart';

var pscod;
var mynid;
var myps;

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Header(),
        Positioned.fill(
          top: 100,
          bottom: 250,
          child: Center(
            child: SigninCard(),
          ),
        ),
      ],
    );
  }
}

class SigninCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxWidth: 420, maxHeight: 420),
      constraints: const BoxConstraints(maxWidth: 620, maxHeight: 620),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Color.fromARGB(255, 241, 74, 74)),
      // color: Color.fromARGB(255, 193, 255, 255)),
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      margin: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Text("VOTER INFO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 228, 0),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Noto Sans Black",
                )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Text("VOTER INFORMATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(248, 237, 245, 225),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Noto Sans Black",
                )),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 2.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                maxLength: 20,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  mynid = text;
                  //   print('$mynid');
                },
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "NID NUMBER",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(236, 237, 245, 225)),
                    fillColor: Color.fromARGB(221, 235, 21, 21)),
                style: TextStyle(
                  color: Color.fromARGB(221, 0, 0, 0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Noto Sans Black",
                ),
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                maxLength: 10,
                autofocus: true,
                onChanged: (text2) {
                  myps = text2;
                  // print('$myps');
                  pscod = myps;
                },
                keyboardType: TextInputType.number,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "POST CODE",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(236, 237, 245, 225)),
                    fillColor: Colors.black87),
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Noto Sans Black",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(45.0, 25.0, 40.0, 0.0),
              child: ButtonTheme(
                minWidth: 320,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                    ),
                    color: Color.fromARGB(255, 37, 255, 121),
                    textColor: Colors.white,
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    splashColor: Color.fromARGB(255, 170, 0, 0),
                    elevation: 2.0,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                    child: Text("GET VOTER INFO",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Noto Sans Black",
                          fontWeight: FontWeight.bold,
                        ))),
              )),
        ],
      ),
    );
  }
}

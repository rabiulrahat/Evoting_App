import 'package:demo_app2/UI/VoterInfo_Ui/genisisblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'UI/VoterInfo_Ui/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome To Control Unit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Control unit for cast vote",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),
              MaterialButton(
                minWidth: double.minPositive,
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Colors.yellow,
                color: Color.fromARGB(255, 255, 69, 7),
                textColor: Color.fromARGB(255, 245, 241, 241),
                disabledColor: Colors.black12,
                disabledTextColor: Colors.black26,
                padding: const EdgeInsets.all(21.0),
                splashColor: Color.fromARGB(255, 170, 0, 0),
                elevation: 5.0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => genesis_check()));
                },
                child: const Text(
                  "Check Genesis Block Condition",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),

              // MaterialButton(
              //   minWidth: double.minPositive,
              //   height: 60,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   // color: Colors.yellow,
              //   color: Color.fromARGB(255, 255, 30, 30),
              //   textColor: Color.fromARGB(255, 245, 241, 241),
              //   disabledColor: Colors.black12,
              //   disabledTextColor: Colors.black26,
              //   padding: const EdgeInsets.all(21.0),
              //   splashColor: Color.fromARGB(255, 170, 0, 0),
              //   elevation: 5.0,
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => HomeState()));
              //   },
              //   child: const Text(
              //     "Post Voter Information",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Voter_info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('header'),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 242, 46, 46),
              child: Column(
                children: [Signin()],
              ),
            ),
          ],
        ));
  }
}

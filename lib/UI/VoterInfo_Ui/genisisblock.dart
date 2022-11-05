import 'package:demo_app2/ApiServices/Getservice/genesis_api_service.dart';
import 'package:demo_app2/main.dart';
import 'package:flutter/material.dart';

late bool isVisible = false;
var mytext;

class genesis_check extends StatefulWidget {
  const genesis_check({super.key});

  @override
  State<genesis_check> createState() => _genesis_checkState();
}

class _genesis_checkState extends State<genesis_check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Center(
          child: Column(
            children: [
              SizedBox(height: 300, width: 400),
              if (!isVisible)
                Container(
                  height: 100,
                  width: 400,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    maxLength: 20,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      mytext = text;
                    },
                    autocorrect: false,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        labelText: "Enter Post Code",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(235, 36, 247, 142)),
                        fillColor: Color.fromARGB(221, 235, 21, 21)),
                    style: TextStyle(
                      color: Color.fromARGB(221, 0, 0, 0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto Sans Black",
                    ),
                  ),
                ),
              if (!isVisible)
                Container(
                  child: MaterialButton(
                    minWidth: double.minPositive,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: Colors.yellow,
                    color: Color.fromARGB(255, 37, 255, 81),
                    textColor: Color.fromARGB(255, 245, 241, 241),
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: const EdgeInsets.all(21.0),
                    splashColor: Color.fromARGB(255, 170, 0, 0),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      genesis_req().get_data();
                    },
                    child: const Text(
                      "Create Genesis Block",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
              if (isVisible)
                MaterialButton(
                  minWidth: double.minPositive,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // color: Colors.yellow,
                  color: Color.fromARGB(255, 255, 60, 0),
                  textColor: Color.fromARGB(255, 245, 241, 241),
                  disabledColor: Colors.black12,
                  disabledTextColor: Colors.black26,
                  padding: const EdgeInsets.all(21.0),
                  splashColor: Color.fromARGB(255, 170, 0, 0),
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Voter_info()));
                  },
                  child: const Text(
                    "Enter For Nid verfication",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ],
    )));
  }
}

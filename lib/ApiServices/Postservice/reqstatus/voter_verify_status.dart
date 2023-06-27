import 'package:demo_app2/ApiServices/Getservice/voter_verify.dart';
import 'package:demo_app2/ApiServices/Postservice/vote_cast_api_service.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/homepage.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:demo_app2/main.dart';
import 'package:flutter/material.dart';

class voter_verify extends StatefulWidget {
  const voter_verify({super.key});

  @override
  State<voter_verify> createState() => _voter_verifyState();
}

class _voter_verifyState extends State<voter_verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: FutureBuilder<dynamic>(
                  future: Verify().get_data(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text(
                        error.toString(),
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 2.0),
                      );
                    } else if (snapshot.hasData) {
                      final post = snapshot.data;
                      return SizedBox(
                        child: Text(
                          post.toString(),
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: 2.0),
                        ),
                      );
                    } else {
                      return Text(
                        'Vote already done!Press the button 👇',
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 2.0),
                      );
                    }
                  },
                ),
              ),
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
              padding: EdgeInsets.all(21.0),
              splashColor: Color.fromARGB(255, 170, 0, 0),
              elevation: 5.0,
              child: Text('Ok'),
              onPressed: () async {
                mynid = 0;
                myps = 0;
                pscod = 0;
                d_igest = ' ';
                citeam = ' ';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

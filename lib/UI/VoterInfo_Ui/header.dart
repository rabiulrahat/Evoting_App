import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //here for background color
        //  Container(
        //     padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        //     margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 466.0),
        //     constraints: BoxConstraints(maxHeight: 200),
        //     decoration:
        //         BoxDecoration(color: Color.fromARGB(255, 225, 255, 239))),

        //here for background color
        Container(
          constraints: BoxConstraints(maxWidth: 1366, maxHeight: 768),
          decoration: BoxDecoration(color: Color.fromARGB(255, 198, 200, 210)),
        )
        //background image
        /*Center(
          child: Container(
            child: Image.asset(
              'assets/images/last.jpg',

            ),
          ),
        )*/
      ],
    );
  }
}

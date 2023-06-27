import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

class config_Json_View extends StatelessWidget {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json View',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Config Json View')),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          controller: _firstController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
                scrollDirection: Axis.horizontal,
              controller: _firstController,
              children:
                [JsonView.string(
                  '''{

                  "Polling_officer": {
                      "name": "Shafik Khan",
                      "id": "12345",
                      "polling_station": "nawdoba_word_02",
                      "po_public_key": "MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEY5u40Fe1GoqK5ExkvxttcjvQwqK9yh+yLTbg/0GnxbGqX98IA3ga/JjxNYzrT1iAf4IBkvHB4rZ/lL2vtto6oSXQHj8W6ViwjoWqJI10jPlye0lIoRWWUQWPyhiTVRSs",
                      "po_aea": "ECDSA",
                      "po_aea_bit_size": "384",
                      "po_proof_of_authentication": ""
                  },
                  "Returning_officer": {
                      "name": "Swarowar kabir",
                      "id": "23456",
                      "ro_area": "shariatpur-1",
                      "ro_public_key": "MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEIYkTJQ7AeM+DCwGYwhSOXH2nUJAJwwIAlwAzVCzBiW8xfgFFBGam+nVZo9PUC4Y/Lb60EQaHvMAsbuHmz6/k/lGlhH7XHE0HMZ7uEqEVjjg4OsjKRYt+u0oMJBcH0llf",
                      "ro_aea": "ECDSA",
                      "ro_aea_bit_size": "384",
                      "ro_proof_of_authentication": "MGUCMA2fTED+F0ZzRcqyLgnEHINWtHt6KTHn1wIpy8mEPMKdv+L50LuSfaYbLgPGNHXVPgIxAJ+n4yU2ssMcYDPeys2KP4OuRT0foptaF6NSQtxje7fIEljM5F/viF5jqw5Z9Cw+6Q=="
                  },
                  "election_commission": {
                      "ec_public_key": "MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEm7Jc6TB+6nMvXEU0ElU6amM9va87w2k+3MbRMnmC4YvHrTTWS2cb842CunnupWlY7SwFBRA3W17Lf1JtVaqiXvMYp0woXt8p5ET6pDDs5KWBFZxJTVvC0s42b1yKnU6i",
                      "ec_aea": "ECDSA",
                      "ec_aea_bit_size": "384"
                  },
                  "candidate": {
                      "applicable_candidate": [
                  "006",
                  "007",
                  "013",
                  "008",
                  "009"
                      ],
                      "Digest": "",
                      "Signature": ""
                  }
                }
                ''',
                  theme: JsonViewTheme(
                    keyStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    doubleStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    intStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    stringStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    boolStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    closeIcon: Icon(
                      Icons.close,
                      color: Colors.green,
                      size: 20,
                    ),
                    openIcon: Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 20,
                    ),
                    separator: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class contract_Json_View extends StatelessWidget {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json View',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Contract Json View')),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          controller: _firstController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
                scrollDirection: Axis.horizontal,
              controller: _firstController,
              children:
                [JsonView.string(
                  '''{
 "contract": {
  "command": [
   "REM-a68b58b1f3f370188a74918a3c81ab0bef38e1c3aad5fc7f6f33372b6d7df43d",
   "ADD-a68b58b1f3f370188a74918a3c81ab0bef38e1c3aad5fc7f6f33372b6d7df43d",
   "ADD-a68b58b1f3f370188a74918a3c81ab0bef38e1c3aad5fc7f6f33372b6d7df43d"
  ],
  "digest": [
   "c25083ee9320afdbcd355ae2ab294b3d016d75150e187823f1cc2aad13bca344",
   "5bced15ff506f1095eb0a78a2edcaa35251d2cdb30abd4207f4783586c37ffaf",
   "5bced15ff506f1095eb0a78a2edcaa35251d2cdb30abd4207f4783586c37ffaf"
  ],
  "proof_of_command": [
   "MGQCMEG3NP8jgE98IskdzXu0z57KSdcnpbTkwEZattNRk21C7ZaW1YJ15yYwx1ZCScTW/gIwLxHyBdzmMU6G2PY4SgUCRTX5VybrGFQDbhf0I3ajTitFHh2A9AKs3mP6bu1ErHcn",
   "MGYCMQDMgF7m90t2CnG7GQCd/FSTbVeXTH4iKMe7fp1Y4sTgd/gHJuq6nA6cqd22Lyj1aDoCMQDhP9HTbWC3rFJdY2UuF3P5A4SnT9F2omkX5Jsi8akft8aR3R8bSWjuVPAfOGPEC5E=",
   "MGYCMQDsuag0mmfWclkntWCDrYyFO5aO/V78N23Ie5cJmcLX53jSuqySDaoBT6wIlt0aFHoCMQDEulheBg5f1rpCwLqUZBMKxU3DCy8ibwi4GHOmEhceYGUdVJjnj5UtHVBUO9sury0="
  ]
 }
}
                ''',
                  theme: JsonViewTheme(
                    keyStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    doubleStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    intStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    stringStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    boolStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                    closeIcon: Icon(
                      Icons.close,
                      color: Colors.green,
                      size: 20,
                    ),
                    openIcon: Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 20,
                    ),
                    separator: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

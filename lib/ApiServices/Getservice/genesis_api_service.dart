import 'dart:io';
import 'package:demo_app2/UI/VoterInfo_Ui/genisisblock.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:http/http.dart' as http;

import '../../UI/VoterInfo_Ui/random_numgen.dart';

var seed = getRandString(10);
var baseUrl = "http://localhost:5669/generate_genesis?";
var api = "seed" + "=" + seed + "&" + "pscode" + "=" + mytext;

class genesis_req {
  Future<dynamic> get_data() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + api));

      http.StreamedResponse response = await request.send();

      print(api);
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var string = await response.stream.bytesToString();
        print(string);
        return string;
      } else {
        isVisible = true;
        print(response.reasonPhrase);
        return isVisible;
      }
    } on SocketException {
      throw Failure(
        'No Internet connection 😑',
      );
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
// catch (exception) {
//       log('Not type exception was executed');
//     }
  }
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

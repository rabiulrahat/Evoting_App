import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_app2/ApiServices/Getservice/genesis_api_service.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/homepage.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:http/http.dart' as http;

var baseUrl = "http://localhost:5669/add_vote?";
var api = citeam +"&"+pscod+"&"+digest;

class vote_cast {
  Future<dynamic> post_data() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + api));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var string = await response.stream.bytesToString();
        print(string);
        return string;
      } else {
        print(response.reasonPhrase);
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

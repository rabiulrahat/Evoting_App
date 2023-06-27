import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_app2/ApiServices/Getservice/genesis_api_service.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/homepage.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:http/http.dart' as http;



class vote_cast {
  Future<dynamic> post_data() async {
    try {
      var baseUrl_c = "http://localhost:5669/add_vote?";
      var api_c = "vote=" + citeam + "&pscode=" + pscod + "&digest=" + d_igest;
      var uul = baseUrl_c = baseUrl_c + api_c;
      print(d_igest);
      var request = http.MultipartRequest('POST', Uri.parse(uul));

      http.StreamedResponse response = await request.send();
      d_igest = "";

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        print(d_igest);
        d_igest = "";

        var string = await response.stream.bytesToString();
        return string;
      } else {
        // print(api_c);
        print(d_igest);
                d_igest = "";


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

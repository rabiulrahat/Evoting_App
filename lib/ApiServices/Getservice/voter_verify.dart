import 'dart:io';
import 'package:http/http.dart' as http;
import '../../UI/VoterInfo_Ui/homepage.dart';

var B_isVisible = false;
var baseUrl_v = "http://localhost:5669/verify_a_voter?";
 var api_v = "=" + "" + D_igest;

class Verify {
  Future<dynamic> get_data() async {
    try {
      var request = http.MultipartRequest('GET', Uri.parse(baseUrl_v+api_v));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var string = await response.stream.bytesToString();
        // print(string);
        B_isVisible = true;
        return string;
      } else {
        B_isVisible = false;
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

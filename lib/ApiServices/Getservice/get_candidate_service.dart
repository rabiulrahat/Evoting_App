import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:demo_app2/DataModels/Datamode_candidate.dart';

class voter_get {
  Future<CandidateList?> getdata() async {
    var request = http.MultipartRequest(
        'GET', Uri.parse('http://localhost:5669/get_candidate'));

    http.StreamedResponse response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var body = responsed.body;
    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.

      final data = CandidateList.fromJson(json.decode(body));
      // List<dynamic> dataList;

      // for (var i in dataList) print('$i');
      return data;
    } else if (response.statusCode == 404) {
      print('Data not found');
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Candidate List');
    }
  }

  post_data() {}
}

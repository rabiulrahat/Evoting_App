import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_app2/DataModels/Datamodel_get_api/datamodel_get_info.dart';

class voter_get {
  Future<VoterInfo?> getdata(var userid, var pscode) async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'http://localhost:8888/sword_of_durant?nid=$userid&pscode=$pscode'));

    http.StreamedResponse response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var body = responsed.body;
    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      final data = VoterInfo.fromJson(json.decode(body));
      final VoterInfo responsedata = data;
      return responsedata;
    } else if (response.statusCode == 404) {
      print('Data not found');
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to load voter info');
    }
    return null;
  }
}

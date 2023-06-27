import 'dart:convert';
import 'dart:io';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../homepage.dart';
import '../signin.dart';

class DeepFaceVerificationScreen extends StatefulWidget {
  @override
  _DeepFaceVerificationScreenState createState() =>
      _DeepFaceVerificationScreenState();
}

class _DeepFaceVerificationScreenState
    extends State<DeepFaceVerificationScreen> {
   var _image1;
  File? _image2;
  late String image1;
  late String image2;

  bool _verificationResult = false;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    _image1 = v_image1;
    image1 = _image1 as String;
    if (result != null) {
      setState(() {
        _image2 = File(result.files.single.path!);
        image2 = result.files.single.path!;
      });
    }
  }

  Future<bool> verifyImages() async {
    var url = Uri.parse('http://127.0.0.1:5000/verify');

    var requestBody = {
      "img1_path": image1,
      "img2_path": image2,
      "model_name": "Facenet",
      "detector_backend": "mtcnn",
      "distance_metric": "euclidean"
    };

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      bool result = jsonResponse['verified'].toString().toLowerCase() == 'true';
      print(image1);
      print(result);
      return result;
    } else {
      throw Exception('Failed to verify images: ${response.statusCode}');
    }
  }

  Future<void> _verifyImages() async {
    if (_image1 != null && _image2 != null) {
      setState(() {
        _verificationResult =
            false; // Reset the verification result before making the API call
      });

      try {
        bool verificationResult = await verifyImages();

        setState(() {
          _verificationResult = verificationResult;
        });
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while verifying images.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please select both images.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('DeepFace Verification'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          // padding: EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text(
                  'Select Images',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Image.network(v_image1,
                    fit: BoxFit.cover, height: 175.0, width: 175.0),
                SizedBox(height: ScreenUtil().setHeight(20)),
                TextButton(
                  onPressed: _selectFile,
                  child: Container(
                    width: 200,
                    height: ScreenUtil().setHeight(200),
                    color: Colors.grey[200],
                    child: _image2 != null
                        ? Image.file(_image2!, fit: BoxFit.cover)
                        : Icon(Icons.add, size: 50),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                ElevatedButton(
                  onPressed: _verifyImages,
                  child: Text('Verify'),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                _verificationResult == true
                    ? Text(
                        'Verification Result: Match',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      )
                    : SizedBox(),
                _verificationResult == null || _verificationResult == false
                    ? Text(
                        'Verification Result: Do not Match',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 250, 18, 18),
                        ),
                      )
                    : SizedBox(),
                  _verificationResult == true?
                  MaterialButton(
                    minWidth: double.minPositive,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: Colors.yellow,
                    color: const Color.fromARGB(255, 35, 253, 78),
                    textColor: const Color.fromARGB(255, 245, 241, 241),
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: const EdgeInsets.all(21.0),
                    splashColor: const Color.fromARGB(255, 170, 0, 0),
                    elevation: 5.0,
                    onPressed: () {
                      if (true) {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    candidate()));
                        false;
                      }
                      if (true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    candidate()));
                      }
                    },
                    child: const Text(
                      "Press For Enter Ballot Unit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ): MaterialButton(
                        minWidth: double.minPositive,
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: Colors.yellow,
                        color: Color.fromARGB(255, 253, 35, 35),
                        textColor: const Color.fromARGB(255, 245, 241, 241),
                        disabledColor: Colors.black12,
                        disabledTextColor: Colors.black26,
                        padding: const EdgeInsets.all(21.0),
                        splashColor: const Color.fromARGB(255, 170, 0, 0),
                        elevation: 5.0,
                        onPressed: () {
                          if (true) {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage()));
                            false;
                          }
                          if (true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage()));
                          }
                        },
                        child: const Text(
                          "Go Back To Home page",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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

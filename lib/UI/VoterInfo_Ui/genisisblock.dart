import 'package:demo_app2/ApiServices/Postservice/reqstatus/reqstatus_genesis.dart';
import 'package:demo_app2/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


var mytext;
var filevalue;
var fileval;
class genesis_check extends StatefulWidget {
  const genesis_check({super.key});

  @override
  State<genesis_check> createState() => _genesis_checkState();
}
class _genesis_checkState extends State<genesis_check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Center(
          child: Column(
            children: [
              const SizedBox(height: 300, width: 400),
                MaterialButton(
                  minWidth: double.minPositive,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // color: Colors.yellow,
                  color: const Color.fromARGB(255, 255, 60, 0),
                  textColor: Color.fromARGB(255, 245, 241, 241),
                  disabledColor: Colors.black12,
                  disabledTextColor: Colors.black26,
                  padding: const EdgeInsets.all(21.0),
                  splashColor: Color.fromARGB(255, 170, 0, 0),
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Voter_info()));
                  },
                  child: const Text(
                    "Enter For Nid Verification",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ],
    )));
  }
}

class Fileselect extends StatefulWidget {
  @override
  _FileselectState createState() => _FileselectState();
}

class _FileselectState extends State<Fileselect> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 198, 102),
        title: Center(
          child: const Text('Genesis Block Section',
                      style: TextStyle(color: Color.fromARGB(255, 12, 10, 10), fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(!isVisible)
            MaterialButton(
              minWidth: double.minPositive,
              height: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // color: Colors.yellow,
              color: Color.fromARGB(255, 255, 37, 37),
              textColor: Color.fromARGB(255, 245, 241, 241),
              disabledColor: Colors.black12,
              disabledTextColor: Colors.black26,
              padding: const EdgeInsets.all(21.0),
              splashColor: Color.fromARGB(255, 170, 0, 0),
              elevation: 5.0,
              onPressed: () {
                selectImage();
              },
              child: const Text(
                "Select Key",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            filevalue == null
                ? const Text('No directory selected')
                : Text("Directory Path: ${filevalue}"),
            Padding(padding: EdgeInsets.all(20.0)),

            if (filevalue != null &&!isVisible)
              SizedBox(
                height: 100,
                width: 400,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  maxLength: 20,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mytext = text;
                  },
                  autocorrect: false,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      labelText: "Enter Post Code",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(235, 36, 247, 142)),
                      fillColor: Color.fromARGB(221, 235, 21, 21)),
                  style: TextStyle(
                    color: Color.fromARGB(221, 0, 0, 0),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Noto Sans Black",
                  ),
                ),
              ),
            Padding(padding: EdgeInsets.all(20.0)),
            if (filevalue != null && !isVisible)
              MaterialButton(
                minWidth: double.minPositive,
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Colors.yellow,
                color: Color.fromARGB(255, 37, 255, 81),
                textColor: Color.fromARGB(255, 245, 241, 241),
                disabledColor: Colors.black12,
                disabledTextColor: Colors.black26,
                padding: const EdgeInsets.all(21.0),
                splashColor: Color.fromARGB(255, 170, 0, 0),
                elevation: 5.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => reqstatus_genesis()));
                },
                child: const Text(
                  "Create Genesis Block",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            // ElevatedButton(
            //   onPressed: () {
            //     vase(filevalue);
            //   },
            //   child: const Text('Select Key'),
            // ),
          ],
        ),
      ),
    );
  }

  selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      //  allowedExtensions: []
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        filevalue = file.path;
        fileval = file.bytes;
      });
    } else {
      filevalue = null;
    }
  }
}

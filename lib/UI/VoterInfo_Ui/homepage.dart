import 'package:demo_app2/ApiServices/Getservice/voter_verify.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:demo_app2/ApiServices/Getservice/get_api_service.dart';
import 'package:demo_app2/DataModels/Datamodel_get_api/datamodel_get_info.dart';

import 'face_verification/face_verify.dart';

late var v_image1;
var d_igest;
late String D_igest;
late String gname;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<VoterInfo?> voterCall;
  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    super.initState();
    voterCall = voter_get().getdata(mynid, myps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Voter Information"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            mynid = 0;
            myps = 0;
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        controller: _firstController,
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: _firstController,
          children: [
            FutureBuilder(
              future: voterCall,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  VoterInfo data = snapshot.data as VoterInfo;
                  Verify().get_data();
                  //This part for screen size reading and make our screen responsive
                  //by giving output of screen regulation
                  var screenSize = MediaQuery.of(context).size;
                  var s;
                  var s1;
                  var padd = 10.0;
                  var padd2 = 0.0;
                  if (screenSize.width >= 1100) {
                    s = 1100.0;
                    s1 = screenSize.height;
                    padd = 120;
                    padd2 = 250;
                  } else {
                    padd = 100;
                    padd2 = 100;
                  }
                  //
                  d_igest = data.loc.substring(12, 76);
                  D_igest = data.digest;
                  gname = data.name;
                  v_image1 =
                      "http://localhost:8888/sword_of_durant/${data.loc}";
                  // print(digest);
                  //this part is for our screen type and others part
                  return SizedBox(
                      width: s,
                      height: s1,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(padd2, 20, 0, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.green,
                                width: 5,
                              ),
                            ),
                            child: SafeArea(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.all(20),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 10, right: 10),
                                        //padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                              'http://localhost:8888/sword_of_durant/${data.loc}',
                                              fit: BoxFit.cover,
                                              height: 175.0,
                                              width: 175.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(padd),
                                  ),
                                  Column(
                                    children: [
                                      //For  name
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomPaint(
                                              //foregroundPainter: NotchPainter(notchSize: 8),
                                              child: Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.man,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    const SizedBox(width: 20),
                                                    const Text(
                                                      'Name:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                    ),
                                                    Text(
                                                      data.name,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  228),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      //For nid
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomPaint(
                                              //foregroundPainter: NotchPainter(notchSize: 8),
                                              child: Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.numbers,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    const SizedBox(width: 20),
                                                    const Text(
                                                      'Nid:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(42.0),
                                                    ),
                                                    Text(
                                                      data.nid,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  228),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //this container content post
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomPaint(
                                              //foregroundPainter: NotchPainter(notchSize: 8),
                                              child: Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.post_add,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    const SizedBox(width: 6),
                                                    const Text(
                                                      'Post code:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(30.0),
                                                    ),
                                                    Text(
                                                      data.pscode,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  228),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                      ),
                                      Row(
                                        children: [
                                          MaterialButton(
                                            splashColor: Colors.red,
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            minWidth: 108,
                                            height: 50,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      scrollable: true,
                                                      title:
                                                          const Text('Address'),
                                                      content: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Form(
                                                          child: Column(
                                                            children: <Widget>[
                                                              //
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPaint(
                                                                      //foregroundPainter: NotchPainter(notchSize: 8),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              2,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blueGrey[100],
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(2),
                                                                            bottomRight:
                                                                                Radius.circular(2),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const Icon(Icons.place,
                                                                                color: Color.fromARGB(115, 57, 68, 218),
                                                                                size: 20),
                                                                            const SizedBox(width: 6),
                                                                            const Text(
                                                                              'District:',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(40.0),
                                                                            ),
                                                                            Text(
                                                                              data.address.district,
                                                                              style: const TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              ///
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPaint(
                                                                      //foregroundPainter: NotchPainter(notchSize: 8),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              2,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blueGrey[100],
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(2),
                                                                            bottomRight:
                                                                                Radius.circular(2),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const Icon(Icons.place,
                                                                                color: Color.fromARGB(115, 57, 68, 218),
                                                                                size: 20),
                                                                            const SizedBox(width: 6),
                                                                            const Text(
                                                                              'Thana:',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(67.0),
                                                                            ),
                                                                            Text(
                                                                              data.address.thana,
                                                                              style: const TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPaint(
                                                                      //foregroundPainter: NotchPainter(notchSize: 8),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              2,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blueGrey[100],
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(2),
                                                                            bottomRight:
                                                                                Radius.circular(2),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const Icon(Icons.place,
                                                                                color: Color.fromARGB(115, 57, 68, 218),
                                                                                size: 20),
                                                                            const SizedBox(width: 6),
                                                                            const Text(
                                                                              'Union:',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(58.0),
                                                                            ),
                                                                            Text(
                                                                              data.address.union,
                                                                              style: const TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        CustomPaint(
                                                                      //foregroundPainter: NotchPainter(notchSize: 8),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              2,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blueGrey[100],
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(2),
                                                                            bottomRight:
                                                                                Radius.circular(2),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const Icon(Icons.place,
                                                                                color: Color.fromARGB(115, 57, 68, 218),
                                                                                size: 20),
                                                                            const SizedBox(width: 6),
                                                                            const Text(
                                                                              'Post office:',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(40.0),
                                                                            ),
                                                                            Text(
                                                                              data.address.po,
                                                                              style: const TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              ///
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        MaterialButton(
                                                            splashColor:
                                                                Colors.red,
                                                            color: Colors.green,
                                                            textColor:
                                                                Colors.white,
                                                            minWidth: 108,
                                                            height: 50,
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Homepage(),
                                                                ),
                                                              );
                                                            },
                                                            child: const Text(
                                                                "ok"))
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: const Text("Address"),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(8.0)),
                                          MaterialButton(
                                              splashColor: Colors.red,
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              minWidth: 108,
                                              height: 50,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: ((context) =>
                                                      AlertDialog(
                                                        scrollable: true,
                                                        title: const Center(
                                                          child: Text(
                                                            'Qr code for Digest',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        5,
                                                                        4),
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        228),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: SizedBox(
                                                            width: 500,
                                                            height: 400,
                                                            child: Column(
                                                              children: [
                                                                QrImageView(
                                                                  data: data
                                                                      .digest,
                                                                  version:
                                                                      QrVersions
                                                                          .auto,
                                                                  size: 350.0,
                                                                  eyeStyle: const QrEyeStyle(
                                                                      eyeShape:
                                                                          QrEyeShape
                                                                              .circle,
                                                                      color: Colors
                                                                          .black),
                                                                  backgroundColor:
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          175,
                                                                          190,
                                                                          192),
                                                                  foregroundColor:
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          20,
                                                                          22,
                                                                          23),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          MaterialButton(
                                                              splashColor:
                                                                  Colors.red,
                                                              color:
                                                                  Colors.green,
                                                              textColor:
                                                                  Colors.white,
                                                              minWidth: 108,
                                                              height: 50,
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const Homepage(),
                                                                  ),
                                                                );
                                                              },
                                                              child: const Text(
                                                                  "ok"))
                                                        ],
                                                      )),
                                                );
                                              },
                                              child: const Text("Digest")),
                                          const Padding(
                                              padding: EdgeInsets.all(8.0)),
                                          MaterialButton(
                                              splashColor: Colors.red,
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              minWidth: 108,
                                              height: 50,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: ((context) =>
                                                      AlertDialog(
                                                        scrollable: true,
                                                        title: const Center(
                                                          child: Text(
                                                            'Qr code for Signature',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        5,
                                                                        4),
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        228),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: SizedBox(
                                                            width: 500,
                                                            height: 400,
                                                            child: Column(
                                                              children: [
                                                                QrImageView(
                                                                  data:
                                                                      data.sign,
                                                                  version:
                                                                      QrVersions
                                                                          .auto,
                                                                  size: 350.0,
                                                                  eyeStyle: const QrEyeStyle(
                                                                      eyeShape:
                                                                          QrEyeShape
                                                                              .circle,
                                                                      color: Colors
                                                                          .black),
                                                                  backgroundColor:
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          175,
                                                                          190,
                                                                          192),
                                                                  foregroundColor:
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          20,
                                                                          22,
                                                                          23),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          MaterialButton(
                                                              splashColor:
                                                                  Colors.red,
                                                              color:
                                                                  Colors.green,
                                                              textColor:
                                                                  Colors.white,
                                                              minWidth: 108,
                                                              height: 50,
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const Homepage(),
                                                                  ),
                                                                );
                                                              },
                                                              child: const Text(
                                                                  "ok"))
                                                        ],
                                                      )),
                                                );
                                              },
                                              child: const Text("Signature")),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.all(8.0)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // if (false)
                        //   MaterialButton(
                        //     minWidth: double.minPositive,
                        //     height: 60,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     // color: Colors.yellow,
                        //     color: const Color.fromARGB(255, 255, 30, 30),
                        //     textColor: const Color.fromARGB(255, 245, 241, 241),
                        //     disabledColor: Colors.black12,
                        //     disabledTextColor: Colors.black26,
                        //     padding: const EdgeInsets.all(21.0),
                        //     splashColor: const Color.fromARGB(255, 170, 0, 0),
                        //     elevation: 5.0,
                        //     onPressed: () {
                        //       genesis_req().get_data();
                        //       Navigator.of(context).pop(context);
                        //     },
                        //     child: const Text(
                        //       "Press For Create Genesis Block",
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold, fontSize: 20),
                        //     ),
                        //   ),
                        // if(!B_isVisible)
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
                                          DeepFaceVerificationScreen()));
                              false;
                            }
                            if (true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DeepFaceVerificationScreen()));
                            }
                          },
                          child: const Text(
                            "Press For Face Verification",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ]));
                } else if (snapshot.hasError) {
                  final error = snapshot.data;

                  return Text(error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.blue,
                      strokeWidth: 10,
                    ),
                  );
                } else if (snapshot == 400) {
                  var nul = snapshot.data.toString();
                  return Center(
                    child: Text(nul.toString()),
                  );
                } else {
                  var nodata = snapshot.data.toString();
                  return const Center(
                    child: Text('Data not found'),

                    // CircularProgressIndicator(

                    //    backgroundColor: Colors.grey,
                    //   color: Colors.blue,
                    //   strokeWidth: 10,
                    // )
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

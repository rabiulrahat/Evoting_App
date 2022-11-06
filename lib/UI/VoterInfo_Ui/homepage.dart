import 'package:demo_app2/ApiServices/Getservice/genesis_api_service.dart';
import 'package:demo_app2/UI/Symbole_ui/ballotunit.dart';
import 'package:demo_app2/UI/VoterInfo_Ui/signin.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:demo_app2/ApiServices/Getservice/get_api_service.dart';
import 'package:demo_app2/DataModels/Datamodel_get_api/datamodel_get_info.dart';

late String digest;
late String gname;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<VoterInfo?> voterCall;
  
  @override
  void initState() {
    super.initState();
    voterCall = voter_get().getdata(mynid, myps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Voter Information"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: voterCall,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              VoterInfo data = snapshot.data as VoterInfo;

              //This part for screen size reading and make our screen responsive
              //by giving output of screen regulation
              var screenSize = MediaQuery.of(context).size;
              var s;
              var s1;
              var padd = 10.0;
              var padd2 = 0.0;
              if (screenSize.width >= 1000) {
                s = 1000.0;
                s1 = screenSize.height;
                padd = 100;
                padd2 = 100;
              } else {
                padd = 20;
                padd2 = 20;
              }
              //
              digest = data.digest;
              gname = data.name;
              print(digest);
              //this part is for our screen type and others part
              return Container(
                  width: s,
                  height: s1,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(padd2, 20, 10, 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                Padding(
                                  padding: EdgeInsets.all(50),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8, top: 10, right: 10),
                                        //padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                              'http://localhost:8888/sword_of_durant/' +
                                                  data.loc,
                                              fit: BoxFit.cover,
                                              height: 175.0,
                                              width: 175.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padd),
                                ),
                                Column(
                                  children: [
                                    //For  name
                                    Container(
                                      child: Row(
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
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.man,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    SizedBox(width: 20),
                                                    Text(
                                                      'Name:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                    ),
                                                    Text(
                                                      data.name,
                                                      style: TextStyle(
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
                                    ),
                                    //For nid
                                    Container(
                                      child: Row(
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
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.numbers,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    SizedBox(width: 20),
                                                    Text(
                                                      'Nid:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              42.0),
                                                    ),
                                                    Text(
                                                      data.nid,
                                                      style: TextStyle(
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
                                    ),

                                    //this container content post
                                    Container(
                                      child: Row(
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
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey[100],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(2),
                                                    bottomRight:
                                                        Radius.circular(2),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.post_add,
                                                        color: Color.fromARGB(
                                                            115, 57, 68, 218),
                                                        size: 20),
                                                    SizedBox(width: 6),
                                                    Text(
                                                      'Post code:',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 5, 4),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                    ),
                                                    Text(
                                                      data.pscode,
                                                      style: TextStyle(
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: MaterialButton(
                                            splashColor: Colors.red,
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Text("Address"),
                                            minWidth: 108,
                                            height: 50,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      scrollable: true,
                                                      title: Text('Address'),
                                                      content: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Form(
                                                          child: Column(
                                                            children: <Widget>[
                                                              //
                                                              Container(
                                                                child: Row(
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
                                                                              EdgeInsets.symmetric(
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
                                                                                BorderRadius.only(
                                                                              topRight: Radius.circular(2),
                                                                              bottomRight: Radius.circular(2),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(Icons.place, color: Color.fromARGB(115, 57, 68, 218), size: 20),
                                                                              SizedBox(width: 6),
                                                                              Text(
                                                                                'District:',
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(40.0),
                                                                              ),
                                                                              Text(
                                                                                data.address.district,
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              ///
                                                              Container(
                                                                child: Row(
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
                                                                              EdgeInsets.symmetric(
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
                                                                                BorderRadius.only(
                                                                              topRight: Radius.circular(2),
                                                                              bottomRight: Radius.circular(2),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(Icons.place, color: Color.fromARGB(115, 57, 68, 218), size: 20),
                                                                              SizedBox(width: 6),
                                                                              Text(
                                                                                'Thana:',
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(67.0),
                                                                              ),
                                                                              Text(
                                                                                data.address.thana,
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Row(
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
                                                                              EdgeInsets.symmetric(
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
                                                                                BorderRadius.only(
                                                                              topRight: Radius.circular(2),
                                                                              bottomRight: Radius.circular(2),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(Icons.place, color: Color.fromARGB(115, 57, 68, 218), size: 20),
                                                                              SizedBox(width: 6),
                                                                              Text(
                                                                                'Union:',
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(58.0),
                                                                              ),
                                                                              Text(
                                                                                data.address.union,
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              Container(
                                                                child: Row(
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
                                                                              EdgeInsets.symmetric(
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
                                                                                BorderRadius.only(
                                                                              topRight: Radius.circular(2),
                                                                              bottomRight: Radius.circular(2),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Icon(Icons.place, color: Color.fromARGB(115, 57, 68, 218), size: 20),
                                                                              SizedBox(width: 6),
                                                                              Text(
                                                                                'Post office:',
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(40.0),
                                                                              ),
                                                                              Text(
                                                                                data.address.po,
                                                                                style: TextStyle(color: Color.fromARGB(255, 5, 5, 4), backgroundColor: Color.fromARGB(255, 255, 255, 228), fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                            child: Text("ok"),
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
                                                            })
                                                      ],
                                                    );
                                                  });
                                            },
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0)),
                                        MaterialButton(
                                            splashColor: Colors.red,
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Text("Digest"),
                                            minWidth: 108,
                                            height: 50,
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    ((context) => AlertDialog(
                                                          scrollable: true,
                                                          title: Center(
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
                                                                  QrImage(
                                                                    data: data
                                                                        .digest,
                                                                    version:
                                                                        QrVersions
                                                                            .auto,
                                                                    size: 350.0,
                                                                    eyeStyle: QrEyeStyle(
                                                                        eyeShape:
                                                                            QrEyeShape
                                                                                .circle,
                                                                        color: Colors
                                                                            .black),
                                                                    backgroundColor:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            175,
                                                                            190,
                                                                            192),
                                                                    foregroundColor:
                                                                        Color.fromARGB(
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
                                                                color: Colors
                                                                    .green,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    Text("ok"),
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
                                                                })
                                                          ],
                                                        )),
                                              );
                                            }),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0)),
                                        MaterialButton(
                                            splashColor: Colors.red,
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Text("Signiture"),
                                            minWidth: 108,
                                            height: 50,
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    AlertDialog(
                                                      scrollable: true,
                                                      title: Center(
                                                        child: Text(
                                                          'Qr code for Signiture',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      5, 5, 4),
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
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
                                                              QrImage(
                                                                data: data.sign,
                                                                version:
                                                                    QrVersions
                                                                        .auto,
                                                                size: 350.0,
                                                                eyeStyle: QrEyeStyle(
                                                                    eyeShape:
                                                                        QrEyeShape
                                                                            .circle,
                                                                    color: Colors
                                                                        .black),
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        175,
                                                                        190,
                                                                        192),
                                                                foregroundColor:
                                                                    Color
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
                                                            color: Colors.green,
                                                            textColor:
                                                                Colors.white,
                                                            child: Text("ok"),
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
                                                            })
                                                      ],
                                                    )),
                                              );
                                            }),
                                      ],
                                    ),
                                    Padding(padding: const EdgeInsets.all(8.0)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: double.minPositive,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // color: Colors.yellow,
                      color: Color.fromARGB(255, 255, 30, 30),
                      textColor: Color.fromARGB(255, 245, 241, 241),
                      disabledColor: Colors.black12,
                      disabledTextColor: Colors.black26,
                      padding: const EdgeInsets.all(21.0),
                      splashColor: Color.fromARGB(255, 170, 0, 0),
                      elevation: 5.0,
                      onPressed: () {
                        genesis_req().get_data();
                        Navigator.of(context).pop(context);
                      },
                      child: const Text(
                        "Press For Create Genesis Block",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    MaterialButton(
                      minWidth: double.minPositive,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // color: Colors.yellow,
                      color: Color.fromARGB(255, 35, 253, 78),
                      textColor: Color.fromARGB(255, 245, 241, 241),
                      disabledColor: Colors.black12,
                      disabledTextColor: Colors.black26,
                      padding: const EdgeInsets.all(21.0),
                      splashColor: Color.fromARGB(255, 170, 0, 0),
                      elevation: 5.0,
                      onPressed: () {
                        if (true) {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => candidate()));
                          false;
                        }
                        if(true)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => candidate()));
                      },
                      child: const Text(
                        "Press For Cast Vote",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ]));
            } else if (snapshot.hasError) {
              final error = snapshot.data;

              return Text(error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
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
              return Center(
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
      ),
    );
  }
}

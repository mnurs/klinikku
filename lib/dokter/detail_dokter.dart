import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:klinikku/konsultasi/pertanyaan.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailDokter extends StatefulWidget {
  @override
  _DetailDokterState createState() => _DetailDokterState();
}

class _DetailDokterState extends State<DetailDokter> {


  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil Dokter",
            style: TextStyle(fontSize: 18.0),
          ),
          backgroundColor: Colors.pink[200],
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "Chatting",
          child: Icon(Icons.chat),
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new PertanyaanIndex()),
            );
          },
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/BG.png"),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Image.asset(
                      "img/dokter/2.png",
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "dr. Juwita Resty Hapsari",
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Dokter Umum",
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: MediaQuery.of(context).size.width,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.work,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "4 Tahun",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Pengalaman",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.class_,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child:  Text(
                                  "Universitas Sebelas Maret",
                                  style: TextStyle(fontSize: 20),overflow: TextOverflow.fade,
                                ),
                              ),

                              Text(
                                "Lulusan",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.account_balance,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "33.2.1.100.2.18.144434",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Surat Tanda Registrasi",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: MediaQuery.of(context).size.width,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.event_available,
                            color: Colors.teal[900],
                          ),
                          title: Text(
                            'Senin - Jumat',
                            style: TextStyle(
                                fontFamily: 'BalooBhai',
                                fontSize: 20.0),
                          ),
                        )),
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.alarm,
                          color: Colors.teal[900],
                        ),
                        title: Text(
                          '09.00 - 18.00',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'Neucha'),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

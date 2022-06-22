import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:klinikku/dokter/detail_dokter.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/home/drawer.dart';
import 'package:klinikku/konsultasi/pertanyaan.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Pesan extends StatefulWidget {
  @override
  _PesanState createState() => _PesanState();
}


class _PesanState extends State<Pesan> {
  List namaDokter = ["dr. Damayanti, SpKK","dr. Ratna Wulansari","dr. Juwita Resty Hapsari"];
  List pesan = ["Selamat Pagi dok","Baik Dokteri Makasih","Siap"];

  bool visible = true ;

  @override
  void initState() {
    super.initState();

  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ReusableAppbar.getAppBar("Konsultasi",Colors.pink[200],context),
      body:
      Container(
        child:  ListView.builder(
            itemCount: namaDokter.length,
//            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var statusAktif = "Online";
              Color statusWarna = Colors.green;
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new  Container(
                          child:   InkWell(
                            onTap: () {
                              var route = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new DetailDokter());
                              Navigator.of(context).push(route);
                            },
                            child: Container(
                              width: 55.0,
                              height: 55.0,
                              // color: Colors.green,
                              child: CircleAvatar(
                                // backgroundColor: Colors.green,
                                foregroundColor: Colors.green,
                                // backgroundImage: NetworkImage(
                                //     "https://img.icons8.com/doodle/48/000000/user.png"),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                        new  Expanded(
                          flex: 6,
                          child:
                          InkWell(
                              onTap: () {
                                Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: "Warning",
                                  content: SingleChildScrollView(
                                      child: Text("Anda akan dikenakan tarif transaksi Rp. 50.000")
                                  ),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Tidak",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: Colors.red,
                                    ),
                                    DialogButton(
                                      child: Text(
                                        "Ya",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => new PertanyaanIndex()),
                                        );
                                      }
                                      ,
                                      color: Colors.blue,
                                    )
                                  ],
                                ).show();
                              },
                              child:
                              Wrap(
                                direction: Axis.vertical,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              namaDokter[index],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(pesan[index],
                                                style: TextStyle(color: Colors.grey[600])
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),

                        ),
                        new Container(
                          width: 50.0,
                          height: 55.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 20.0,
                                decoration: new BoxDecoration(
                                  color: statusWarna,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(statusAktif)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),

      ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

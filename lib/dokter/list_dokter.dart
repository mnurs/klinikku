import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/dokter/detail_dokter.dart';
import 'package:klinikku/home/drawer.dart';

class ListDokter extends StatefulWidget {
  @override
  _ListDokterState createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  List dokter = ["img/dokter/1.png","img/dokter/3.png","img/dokter/2.png"];
  List namaDokter = ["dr. Damayanti, SpKK","dr. Ratna Wulansari","dr. Juwita Resty Hapsari"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.dehaze),
        title: Text('Klinikku Skin Care'),
        backgroundColor: Colors.pink[200],
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: namaDokter.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new DetailDokter());
                  Navigator.of(context).push(route);
                },
                child: Card(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                          child:
                          Image.asset(
                            dokter[index],
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 5,
                        child: Container(
                          // height: 50,
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            namaDokter[index],
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                    offset: Offset(-0.5, -0.5),
                                    color: Colors.white),
                                Shadow(
                                  // bottomRight
                                    offset: Offset(0.5, -0.5),
                                    color: Colors.white),
                                Shadow(
                                  // topRight
                                    offset: Offset(0.5, 0.5),
                                    color: Colors.white),
                                Shadow(
                                  // topLeft
                                    offset: Offset(-0.5, 0.5),
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/drawer.dart';
import 'package:klinikku/treatment/detail_treatment.dart';

class ListTreatment extends StatefulWidget {
  @override
  _ListTreatmentState createState() => _ListTreatmentState();
}

class _ListTreatmentState extends State<ListTreatment> {
  List jasa = ["img/jasa/1.png","img/jasa/2.png","img/jasa/3.png","img/jasa/4.png","img/jasa/5.png","img/jasa/6.png","img/jasa/7.png","img/jasa/8.png","img/jasa/9.png","img/jasa/10.png"];
  List namaJasa = ["FACIAL AQUA GLOW","LASER ND-YAG A","INJEKSI ACNE","BLACK DOLL LASER SPKK","DERMAROLLER SPKK","VIVACE SPKK","ELECTOCAUTER A","FACIAL DETOX AURA","FACIAL ULTRASONIC","CHEMICAL PEELING PREMIUM SPKK"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.dehaze),
        title: Text('Klinikku SkinCare'),
        backgroundColor: Colors.pink[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/BG.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
        child: GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: jasa.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new TreatmentDetail());
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
                          Image.asset(jasa[index],fit: BoxFit.fitHeight,)

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
                            namaJasa[index],
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
    ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';

class TreatmentDetail extends StatefulWidget {
  @override
  _TreatmentDetailState createState() => _TreatmentDetailState();
}

class _TreatmentDetailState extends State<TreatmentDetail> {

  @override
  void initState() {
    // TODO: implement initState
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
        child: Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0),
          child: ListView(
            children: <Widget>[
             Image.asset(
               "img/jasa/1.png",
               fit: BoxFit.contain,
             ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "FACIAL AQUA GLOW",
                    style: TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    "Facial dengan alat AquaGlow, yang berfungsi untuk membersiihkan kulit yang optimal, mengoptimalkan sel kulit mati, mencerahkan, memanjakan sekaligus menghidrasi kulit sehingga kulit lebih segar dan lembab",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}

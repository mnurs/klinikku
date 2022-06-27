import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/home/app_bar.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:siargao_officer/registrasi.dart';

class MemberCard extends StatefulWidget {
  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  void initState(){
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  ReusableAppbar.getAppBar("Klinikki SkinCare",Colors.pink[200],context),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage("img/example_card12.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage("img/example_card13.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ],
        )
    );
  }
}
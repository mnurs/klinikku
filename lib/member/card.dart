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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  Widget build(BuildContext context) {
    var regis = "";
    try{
      DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse("05-06-2022");
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('MM/yy');
      regis = outputFormat.format(inputDate);
    }catch(ex){

    }

    return Scaffold(
        appBar:  ReusableAppbar.getAppBar("Auraderma Skin Care",Colors.pink[200],context),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print('test' + constraints.constrainHeight().toString());
              return  Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:  AssetImage("img/example_card12.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: constraints.constrainHeight() / 2 + 30,
                      left: constraints.constrainWidth() / 4 - 0,
                      height:250,
                      width: 250,
                      child: Container(
                        child: Text(
                          'SL - M0001',
                          style: TextStyle(
                              color : Color(0xFFffdb88),
                              fontSize: 25,
                              fontFamily: 'OCRAStd'
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.constrainHeight() / 2 + 70,
                      left: constraints.constrainWidth() / 4 - 0,
                      height:250,
                      width: 250,
                      child: Container(
                        child: Text(
                          'Executive Number',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Montserrat',
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.constrainHeight() / 2 + 90,
                      left: constraints.constrainWidth() / 4 - 0,
                      height:250,
                      width: 250,
                      child: Container(
                        child: Text(
                          'Muhammad Nur Syaifullah',
                          style: TextStyle(
                              color : Color(0xFFffdb88),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.constrainHeight() / 2 + 70,
                      left: constraints.constrainWidth() / 2 + 90,
                      height:250,
                      width: 250,
                      child: Container(
                        child: Text(
                          'Glowing Since',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.constrainHeight() / 2 + 90,
                      left: constraints.constrainWidth() / 2 + 110,
                      height:250,
                      width: 250,
                      child: Container(
                        child: Text(
                          '${regis.toString()}',
                          style: TextStyle(
                              color : Color(0xFFffdb88),
                              // fontWeight: FontWeight.w900,
                              fontFamily: 'OCRAStd',
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
    );
  }
}
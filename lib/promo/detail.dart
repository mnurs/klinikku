import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'
as http;

class PromoBannerDetail extends StatefulWidget {
  @override
  _PromoBannerDetailState createState() => _PromoBannerDetailState();
}

class _PromoBannerDetailState extends State < PromoBannerDetail > {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Future < void > didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.dehaze),
        title: Text('Klinikku SkinCare'),
        backgroundColor: Colors.pink[200],
      ),
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/BG.png"), fit: BoxFit.cover),
        ),
        child: Padding(
            padding: EdgeInsets.only(),
            child: ListView(
                children: <Widget>[
                  new Image.asset("img/promo_spesial/1.jpg"),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Text(
                            "DISC 10% PREMIUM LOOSE POWDER",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Text(
                              "",
                              style: TextStyle(fontSize: 20.0),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Text(
                            "Ketentuan dan syarat :",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Text(
                              "Ketentuan dan syarat:\n Diskon hingga 50% \n Promo hanya berlaku untuk transaksi di Aplikasi \n Promo berlaku hingga 31 Desember 2022",
                              style: TextStyle(fontSize: 15.0),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Text(
                              "Kode Voucher :",
                              style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.pink, Colors.white]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "A78F6fJJ",
                                style: TextStyle(fontSize: 60.0),),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )
          );
    }
}
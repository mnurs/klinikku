import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:klinikku/home/home.dart';
import 'package:klinikku/pembayaran/konfirmasi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AfterCheckout extends StatefulWidget {
  @override
  _AfterCheckoutState createState() => _AfterCheckoutState();
}

class _AfterCheckoutState extends State<AfterCheckout> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar:  AppBar(
        title: Text("Pembayaran"),
        backgroundColor: Colors.pink[200],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()),(Route<dynamic> route) => false);
            }),
      ),
      floatingActionButton: Container(
        width: 300.0,
        child: FloatingActionButton.extended(
          heroTag: "Bayar",
          elevation: 5.0,
          backgroundColor:Colors.pink[200],
          label: const Text('Bayar'),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KonfirmasiPembayaran()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: new SafeArea(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Segera selesaikan pembayaran Anda",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                new Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text(
                  "sebelum stok habis",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Container(
              color: Colors.grey[300],
              alignment: Alignment(0.0, 0.0),
              child: Column(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "SEGERA LAKUKAN PEMBAYARAN SEBELUM",
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  new Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Text('02:00:00',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.10,
                  child: Text(
                    "Transfer ke nomor Rekening :",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Image.asset(
                  "img/bank/bca.png",
                  fit: BoxFit.fitWidth,
                  width: 80.0,
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new SelectableText("9299239923 A.n Dwi wulansari",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                InkWell(
                  onTap: (){
                      FlutterClipboard.copy("9299239923").then(( value ) =>
                          Alert(context: context,type: AlertType.success, title: "Berhasil", desc: "Berhasil salin nomor rekening").show());
                  },
                  child:  new Text(
                    "Salin No. Rek",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              // Text("OR"),
              // Expanded(child: Divider()),
            ]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Jumlah yang harus dibayar",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Rp. 60.562",
                  style: TextStyle(
                      color: Colors.orange[400],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

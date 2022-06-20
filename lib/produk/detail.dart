import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/pembayaran/keranjang.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  TextEditingController jumlahProduk = TextEditingController();

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
    return Scaffold(
      appBar: ReusableAppbar.getAppBar("Detail Produk",Colors.pink[200],context),
      body: SingleChildScrollView(
        child: Container(
          child: new Column(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: new Container(
                  child: new Hero(
                    tag: "nama",
                    child: new Material(
                      borderRadius: new BorderRadius.circular(30.0),
                      child: new InkWell(
                          child: new Image.asset("img/produk/1.jpg")
                      ),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10.0),
                // color: Colors.teal,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      // height: 300.0,
                      color: Colors.transparent,
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.amber[600],
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: new Text(
                            "CLEANSING MILK",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                        color: Colors.pink[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new Text(
                          "Rp. 100.000",
                          style: TextStyle(
                              fontSize: 29.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    )  ,

                    new Container(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new Text(
                          "Stok : 20 ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold, ),
                        ),
                      ),
                    ),
                    new TextField(
                      controller: jumlahProduk,
                      decoration: new InputDecoration(
                        labelText: "Jumlah",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(10.0)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.amber,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Pesan",
                          ),
                          onPressed: () {
                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new CartScreen());
                            Navigator.of(context).push(route);
                          },
                        ),
                        new Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        new IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              var route = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new CartScreen());
                              Navigator.of(context).push(route);
                            },
                            color: Colors.black)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Colors.grey[350],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new Column(
                          children: <Widget>[
                            Text(
                              "FUNGSI",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "CARA PAKAI",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "KETERANGAN",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "DAYA TAHAN PRODUK",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "PENYIMPANAN",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "BPOM NA182038387409",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.black),
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

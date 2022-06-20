import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/pembayaran/checkout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import fit_image;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _n = 0;
  double subTotal = 0;
  List diskonProduk = [0,10];
  List namaProduk = ["Day Cream","FACIAL TONER"];
  List hargaProduks = ["60.000","50.000"];
  List hargaDiskonProduk = ["0","45.000"];
  List gambarProduk = ["img/produk/1.jpg","img/produk/2.jpg"];
  List jumlahProduk = [1,2];
  List totalProduk = [1,3];
  List totalBayar = ["60.652","150.534","50.000"];

  List diskonJasa = [10];
  List namaJasa = ["Konsultasi Umum"];
  List hargaJasas = ["50.000"];
  List hargaDiskonJasa = ["45.000"];
  List gambarJasa = ["img/dokter/2.png"];
  List jumlahJasa = [1];
  List totalJasa = [1];


  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget hargaProduk(int index){
    if(diskonProduk[index] > 0){
      return Row(
        children: <Widget>[
          new Text(
            "Rp.  ${hargaProduks[index]}",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
                decoration:
                TextDecoration.lineThrough),
          ),
          SizedBox(width: 5,),
          Flexible(
            child: new Text(
              "${hargaDiskonProduk[index]}",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }else{
      return new Text(
        "Rp. ${hargaProduks[index]}",
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  Widget hargaJasa(int index){
    if(diskonJasa[index] > 0){
      return Row(
        children: <Widget>[
          new Text(
            "Rp.  ${hargaJasas[index]}",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
                decoration:
                TextDecoration.lineThrough),
          ),
          SizedBox(width: 5,),
          Flexible(
            child: new Text(
              "${hargaDiskonJasa[index]}",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }else{
      return new Text(
        "Rp. ${hargaJasas[index]}",
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      );
    }
  }


  Future<void> saveCheckout() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Checkout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ReusableAppbar.getAppBar("Keranjang",Colors.pink[200],context),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5.0,
        backgroundColor: Colors.pink[200],
        label: const Text('Checkout'),
        icon: const Icon(Icons.attach_money),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: () async {
          await saveCheckout();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink[200],
        child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          child: Text(
            "Sub Total : Rp. 150.000",
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[50]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/BG.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
              children: <Widget>[
                namaJasa.length != 0 ?
                Flexible(
                  child: Container(
                    height: 105,
                    child: new ListView.builder(
                      itemCount: namaJasa.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: true,
                                        onChanged: (bool) {
                                        },
                                      ),
                                      Image.asset(
                                        gambarJasa[index],
                                        fit: BoxFit.fitHeight,
                                        height: MediaQuery.of(context).size.height / 8,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            // color: Colors.red,
                                            width:
                                            MediaQuery.of(context).size.width / 1.95,
                                            child: Text(
                                              "${namaJasa[index]}",
                                              style: TextStyle(fontSize: 20.0),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // color: Colors.red,
                                              width:
                                              MediaQuery.of(context).size.width / 1.95,
                                              child: hargaJasa(index)
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  // width: MediaQuery.of(context).size.width / 20,
                                                  child: Center(
                                                    child: new Text(
                                                      "${jumlahProduk[index]}",
                                                      // style: new TextStyle(fontSize: 20.0),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ) :
                Container(),
                Flexible(
                  child: new ListView.builder(
                    itemCount: namaProduk.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: true,
                                      onChanged: (bool) {

                                      },
                                    ),
                                    Image.asset(
                                      gambarProduk[index],
                                      fit: BoxFit.fitHeight,
                                      height: MediaQuery.of(context).size.height / 8,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          // color: Colors.red,
                                          width:
                                          MediaQuery.of(context).size.width / 1.95,
                                          child: Text(
                                            "${namaProduk[index]}",
                                            style: TextStyle(fontSize: 20.0),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          // color: Colors.red,
                                            width:
                                            MediaQuery.of(context).size.width / 1.95,
                                            child: hargaProduk(index)
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: IconButton(
                                                  onPressed: (){

                                                  },
                                                  icon: Icon(Icons.remove,color: Colors.teal),
                                                  color: Colors.teal,
                                                ),
                                              ),

                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                // width: MediaQuery.of(context).size.width / 20,
                                                child: Center(
                                                  child: new Text(
                                                    "${jumlahProduk[index]}",
                                                    // style: new TextStyle(fontSize: 20.0),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                child: IconButton(
                                                  icon: Icon(Icons.add,color: Colors.teal),
                                                  onPressed: (){

                                                  },
                                                  color: Colors.teal,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 5,
                                child: Container(
                                  // color: Colors.grey[50],
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            // spreadRadius: 1,
                                            color: Colors.grey,
                                            offset: new Offset(0.5, 1.5),
                                            blurRadius: 2.0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3),
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                        ),
                                      ),
                                      child: IconButton(icon: Icon(Icons.delete), onPressed: (){

                                      })
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/produk/detail.dart';

class ListProduk extends StatefulWidget {
  @override
  _ListProdukState createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  List nama = ["CLEANSING MILK","FACIAL TONER","PURFING MILK","BRIGHTENING MILK","NORMAL SKIN FACIAL","FACIAL WASH OILY","2 IN CLEANSING","DAY CREAM","TABIR SURYA","MOISTURIZING"];
  List harga = ["50.000","60.000","55.000","65.000","40.000","50.000","60.000","55.000","65.000","40.000"];
  List gambar = ["img/produk/1.jpg","img/produk/2.jpg","img/produk/3.jpg","img/produk/4.jpg","img/produk/5.jpg","img/produk/6.jpg","img/produk/7.jpg","img/produk/8.jpg","img/produk/9.jpg","img/produk/10.jpg"];
  List diskon = [0,0,10,0,0,0,10,0,0,10];
  List hargaDiskon = ["45.000","54.000","49.500","58.500","36.000","45.000","54.000","49.500","58.500","36.000"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget tampilanGambarProduk(int index){
    return  Image.asset(gambar[index]);
  }

  Widget tampilanNamaProduk(int index){
    return Positioned(
      bottom: 25,
      left: 10,
      child: Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width / 2.3,
        child: new Text(
          nama[index],
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15.0,
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
    );
  }

  Widget tampilanHargaProduk(int index){
    return Positioned(
      bottom: 5,
      left: 10,
      child: new Text(
        "Rp. ${harga[index]}",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
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
    );
  }

  Widget tampilanHargaProdukDiskon(int index){
    return  Positioned(
        bottom: 5,
        left: 10,
        child: Row(
          children: <Widget>[
            new Text(
              "Rp. ${harga[index]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough),
            ),
            new Padding(
              padding: new EdgeInsets.all(1.0),
            ),
            new Text(
              "Rp. ${hargaDiskon[index]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
          ],
        )
    );
  }

  Widget tampilanDiskon(int index){
    return Positioned(
      top: 5,
      left: 130,
      child:  new Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 02.0),
          ),
          new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 02.0),
              ),
              new Text(
                "${diskon[index]}%",
                style: TextStyle(
                    color: Colors.amber[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              new Text(
                "OFF",
                style: TextStyle(
                    color: Colors.amber[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tampilanProduk(int index){
    return new Container(
      child: InkWell(
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new ProductDetail(
            ),
          );
          Navigator.of(context).push(route);
        },
        child: new Card(
          elevation: 5.0,
          child: Stack(
            children: <Widget>[
              tampilanGambarProduk(index),
              tampilanNamaProduk(index),
              tampilanHargaProduk(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget tampilanProdukDiskon(int index){
    return new Container(
      padding: new EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          // var route = new MaterialPageRoute(
          //   builder: (BuildContext context) => new ProductDetail(
          //   ),
          // );
          // Navigator.of(context).push(route);
        },
        child:  new Card(
          elevation: 5.0,
          child: new Stack(
            children: <Widget>[
              tampilanGambarProduk(index),
              tampilanDiskon(index),
              tampilanNamaProduk(index),
              tampilanHargaProdukDiskon(index),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ReusableAppbar.getAppBar("Produk", Colors.pink[200],context),
      body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/BG.png"), fit: BoxFit.cover)),
          child: SingleChildScrollView (
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child:GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: nama.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (["", null, false, 0].contains(diskon[index])){
                            return tampilanProduk(index);
                          }else{
                            if (diskon[index] == 0) {
                              return tampilanProduk(index);
                            } else {
                              return tampilanProdukDiskon(index);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
          )

      )
    );
  }

}

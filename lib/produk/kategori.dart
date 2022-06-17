import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/drawer.dart';
import 'package:klinikku/produk/list.dart';

class KategoriProduk extends StatefulWidget {
  @override
  _KategoriProdukState createState() => _KategoriProdukState();
}

class _KategoriProdukState extends State<KategoriProduk> {
  List namaProduk = ["Pembersih Wajah","Krim Pagi & Krim Malam","Serum", "Perawatan Tubuh", "Produk Dekoratif","Masker","Perawatan Rambut"];
  List gambarProduk = ["img/meta/1.jpg","img/meta/2.jpg","img/meta/3.jpg","img/meta/4.jpg","img/meta/5.jpg","img/meta/6.jpg","img/meta/7.jpg"];

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
        child:  SafeArea(
          child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: gambarProduk.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new ListProduk());
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
                            Image.asset(gambarProduk[index],
                                fit: BoxFit.contain,)
                            )
                        ),
                        Positioned(
                          bottom: 10,
                          left: 5,
                          child: Container(
                            // height: 50,
                            // color: Colors.red,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Text(
                              "${namaProduk[index]}",
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
        )
      ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/drawer.dart';
import 'package:klinikku/promo/detail.dart';

class ListPromo extends StatefulWidget {
  @override
  _ListPromoState createState() => _ListPromoState();
}

class _ListPromoState extends State<ListPromo> {
  List promo = ["img/promo_spesial/1.jpg","img/promo_spesial/2.jpg","img/promo_spesial/3.jpg","img/promo_spesial/4.jpg","img/promo_spesial/5.jpg","img/promo_spesial/6.jpg","img/promo_spesial/7.jpg","img/promo_spesial/8.jpg","img/promo_spesial/9.jpg"];

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
          child: ListView.builder(
            itemCount: promo.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new PromoBannerDetail()));
                    },
                    child: Card(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                border: Border.all(color: Colors.grey)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3.0),
                              child:
                              Image.asset(promo[index], fit: BoxFit.fill,)
                            ),
                          ),
                        ],
                      ),
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

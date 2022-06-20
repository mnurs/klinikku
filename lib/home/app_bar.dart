import 'package:flutter/material.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/pembayaran/keranjang.dart';

class ReusableAppbar {
  static getAppBar(String title, Color? bgColor,BuildContext context){
    return AppBar(
      title: Text(title),
      backgroundColor: bgColor,
      actions: <Widget>[
        new Padding(padding: const EdgeInsets.all(10.0),
          child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                },

                child: new Stack(

                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart,
                      color: Colors.white,),
                      onPressed: null,
                    ),
                    Config.TotalProduk == 0 ? new Container() :
                    new Positioned(

                        child: new Stack(
                          children: <Widget>[
                            new Icon(
                                Icons.brightness_1,
                                size: 20.0, color: Colors.white),
                            new Positioned(
                                top: 3.0,
                                right: 4.0,
                                child: new Center(
                                  child: new Text(
                                    Config.TotalProduk.toString(),
                                    style: new TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )),


                          ],
                        )),

                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}
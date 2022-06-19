import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/detail_histori/rincian_pesanan.dart';
import 'package:klinikku/history/index.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Dikirim extends StatelessWidget {
  List diskonProduk = [0,10];
  List namaProduk = ["Day Cream","FACIAL TONER"];
  List hargaProduks = ["60.000","50.000"];
  List hargaDiskonProduk = ["0","45.000"];
  List gambarProduk = ["img/produk/1.jpg","img/produk/2.jpg"];
  List jumlahProduk = [1,2];
  List totalProduk = [1,3];
  List totalBayar = ["60.652","150.534","50.000"];

  var formatDate = DateFormat('dd MM yyyy');

  Widget underline(BuildContext context){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width / 1.07,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide( //                   <--- left side
                color: Colors.black12,
                width: 1.0,
              ),
            ),
          ),
        ) ,
      ],
    );
  }

  Widget hargaProduk(int index){
    if(diskonProduk[index] > 0){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text(
            "Rp. "+ hargaProduks[index],
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
              "Rp. "+  hargaDiskonProduk[index],
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
        "Rp. "+  hargaProduks[index],
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/BG.png"), fit: BoxFit.cover)),
      child: SafeArea(
        child: new ListView.builder(
          itemCount: namaProduk.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RincianPesanan(status: Config.StatusDikirim)));
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child:  Text("Dikirim",textAlign: TextAlign.right),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 10))
                                  ],
                                ),

                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    new Image.asset(
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
                                            namaProduk[index],
                                            style: TextStyle(fontSize: 20.0),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                // width: MediaQuery.of(context).size.width / 20,
                                                child: Center(
                                                  child: new Text(
                                                    "x"+ jumlahProduk[index].toString(),
                                                    textAlign: TextAlign.right,
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
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          // color: Colors.red,
                                            width:
                                            MediaQuery.of(context).size.width / 1.95,
                                            child: hargaProduk(index)
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                totalProduk[index] > 1 ? underline(context) : Container(),
                                totalProduk[index] > 1 ?  SizedBox(height: 10.0,) : Container(),
                                totalProduk[index] > 1 ?
                                Row(
                                  children: <Widget>[

                                    Expanded(
                                      child:  Text(  "Tampilkan "+ totalProduk[index].toString() +" produk lagi",textAlign: TextAlign.center),
                                    ),

                                    Padding(padding: EdgeInsets.only(right: 10))
                                  ],
                                )
                                    :
                                Container(),

                                underline(context),
                                SizedBox(height: 10.0,),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text( totalProduk[index].toString() +" produk",textAlign: TextAlign.left),
                                    Expanded(
                                      child:  Text("Total Pesanan : Rp. "+ totalBayar[index],textAlign: TextAlign.right),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 10))
                                  ],
                                ),


                                underline(context),
                                SizedBox(height: 10.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Expanded(
                                      child:Text("Konfirmasi terima produk sebelum "+ formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)),textAlign: TextAlign.left),
                                    ),

                                    RaisedButton(
                                      child: Text("Pesanan Diterima"),
                                      onPressed: (){
                                        Alert(
                                          context: context,
                                          type: AlertType.warning,
                                          title: "",
                                          desc: "Barangnya sudah saya terima dan saya siap glowing.",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "NANTI SAJA",
                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                              ),
                                              onPressed: () => Navigator.pop(context),
                                              color: Colors.pink[200],
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "KONFIRMASI",
                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                              ),
                                              onPressed: (){
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => new HistoriIndex(),
                                                  ),
                                                );
                                              },
                                              color: Colors.pink[200],
                                            )
                                          ],
                                        ).show();
                                      },
                                      color: Colors.pink[200],
                                      textColor: Colors.white,
                                      splashColor: Colors.grey,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 10))
                                  ],
                                ),

                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}
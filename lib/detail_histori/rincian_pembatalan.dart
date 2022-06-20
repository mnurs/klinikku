import 'package:flutter/material.dart';
import 'package:klinikku/config/currency_format.dart';

class RincianPembatalan extends StatefulWidget {
  @override
  _RincianPembatalanState createState() => _RincianPembatalanState();
}

class _RincianPembatalanState extends State<RincianPembatalan> {

  Widget underline(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width/1.07,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rincian Pembatalan"),
          backgroundColor: Colors.pink[200],
          leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body:  new SingleChildScrollView(
          child:  new SafeArea(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    child: Container(
                                        child: Text("Dibatalkan oleh",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text("Pembeli",textAlign: TextAlign.right,style: TextStyle(
                                            color: Colors.pink
                                        ),)
                                    )
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            underline(),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    child: Container(
                                        child: Text("Dibatalkan pada",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text("04-05-2022 12:06",textAlign: TextAlign.right,)
                                    )
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            underline(),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    child: Container(
                                        child: Text("Alasan Batal",textAlign: TextAlign.left,style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),)
                                    )
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    child: Container(
                                        child: Text("Ingin merubah pesanan(ukuran,warna,jumlah,dll)",textAlign: TextAlign.left)
                                    )
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                          ],
                        )
                    ),
                    Card(
                        child: Column(
                          children: <Widget>[

                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    child: Container(
                                        child: Text("Dana Pengembalian",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text("Rp."+ FormatCurrency.Currency("250000").toString(),style: TextStyle(color: Colors.pink),textAlign: TextAlign.right,),
                                    )
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                          ],
                        )
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}

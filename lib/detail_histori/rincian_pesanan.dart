import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/config/currency_format.dart';
import 'package:klinikku/detail_histori/rincian_pembatalan.dart';
import 'package:klinikku/history/index.dart';
import 'package:klinikku/pembayaran/keranjang.dart';
import 'package:klinikku/pembayaran/konfirmasi.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class  RincianPesanan extends StatefulWidget {
  @override
  String status;
  RincianPesanan({required this.status});
  _RincianPesananState createState() => _RincianPesananState();
}

class _RincianPesananState extends State<RincianPesanan>{
  var formatDate = DateFormat('dd-MM-yyyy');
  var datePesanan;
  var dateBelumBayar;
  var dateDikemas;
  var dateDikirim;
  var dateDibatalkan;
  var dateSelesai;
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
    // TODO: implement initState
    super.initState();
    datePesanan = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 4));
    dateBelumBayar = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3));
    dateDikemas = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2));
    dateDikirim = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
    dateSelesai = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
    dateDibatalkan = formatDate.format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
  }

  keteranganStatus(){
    if(widget.status == Config.StatusBelumBayar){
      return Config.KeteranganBelumBayar(dateBelumBayar,"BCA",datePesanan) ;
    }else if(widget.status == Config.StatusDikemas){
      return Config.KeteranganDikemas(dateDikemas,dateBelumBayar) ;
    }else if(widget.status == Config.StatusDikirim){
      return Config.KeteranganDikirim(dateDikirim,dateDikemas) ;
    }else if(widget.status == Config.StatusSelesai){
      return Config.KeteranganSelesai ;
    }
    else if(widget.status == Config.StatusDibatalkan){
      return Config.KeteranganDibatalkan(dateDibatalkan) ;
    }else{
      return Container();
    }
  }

  Widget keterangan(){
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                Icon(Icons.library_books),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(widget.status,style: TextStyle(
                    fontWeight: FontWeight.bold
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 45)),
                Container(
                    width: MediaQuery.of(context).size.width / 1.20,
                    child: Text(keteranganStatus())
                ),

              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    ) ;
  }

  Widget alamatPengiriman(){
    var alamatWilayah = "Jl. Fatmawati Raya No 4 RT 06 RW 03 Jakarta Selatan, Indonesia 15431 Fatmawati Festival Blok A-7";

    return InkWell(
        onTap: (){
          // widget.status == Config.StatusBelumBayar ?
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AlamatList())) :  "";
        },
        child:
        Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                    Icon(Icons.location_on),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child:  Text("Alamat Pengiriman",style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                    ),
                    widget.status == Config.StatusBelumBayar ?
                    Container(
                        child:  FlatButton(
                          onPressed: () {  },
                          child: Text("Ubah",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                        )
                    )
                        :
                    Container( )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 45)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Ahmad Yani")
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 45)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("0872323232436")
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 45)),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text(
                            alamatWilayah
//                            "Jl. Fatmawati Raya No 4 RT 06 RW 03 Jakarta Selatan, Indonesia 15431 Fatmawati Festival Blok A-7",
                        )
                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
              ],
            )
        )
    );
  }

  Widget informasiPembayaran(){
    var totalJasa = "50000";
    var totalProduk = "110000";
    var kdbayar = "652";
    int totalProdukJasa = int.parse(totalProduk) + int.parse(totalJasa) + int.parse(kdbayar.toString());
    int totalSeluruhnya = totalProdukJasa + 15000 ;
    if(widget.status == Config.StatusBelumBayar){
      return Column(
        children: <Widget>[
          ongkosKirim(),
          kodeBayar(),
          Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                      Icon(Icons.monetization_on),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text("Informasi Pembayaran",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(right: 45)),
                      Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.20,
                            child: Text("Total Pesanan",style: TextStyle(
                                fontWeight: FontWeight.bold
                            ))
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width / 1.20,
                            child: Text("Rp. "+ FormatCurrency.Currency(totalSeluruhnya.toString()).toString(),textAlign: TextAlign.right,)
                        ),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )
        ],
      );
    }else{
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                  Icon(Icons.monetization_on),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Informasi Pembayaran",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ))
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 45)),
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Subtotal untuk Produk",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ))
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Rp. "+FormatCurrency.Currency(totalProdukJasa.toString()).toString(),textAlign: TextAlign.right,)
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 45)),
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Pengiriman",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ))
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Rp."+ FormatCurrency.Currency("15000").toString(),textAlign: TextAlign.right,)
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 45)),
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Diskon pengiriman",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ))
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("- Rp. "+ FormatCurrency.Currency("0").toString(),textAlign: TextAlign.right,)
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 45)),
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Total Pesanan",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ))
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.20,
                        child: Text("Rp. "+ FormatCurrency.Currency(totalSeluruhnya.toString()).toString(),textAlign: TextAlign.right,)
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }
  }

 Widget statusPengiriman(){
   if(widget.status == Config.StatusDikemas || widget.status == Config.StatusDikirim  ){
     return InkWell(
       onTap: (){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => StatusPengiriman()));
       },
       child:  Card(
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                   Icon(Icons.directions_car),
                   Padding(padding: EdgeInsets.only(left: 10)),
                   Expanded(
                     child: Container(
                         width: MediaQuery.of(context).size.width / 1.20,
                         child:  Text("Status Pengiriman",style: TextStyle(
                             fontWeight: FontWeight.bold
                         ))
                     ),
                   ),
                   Text("LACAK >",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.pink
                   ))
                 ],
               ),
               Row(
                 children: <Widget>[
                   Padding(padding: EdgeInsets.only(left: 45,top: 30)),
                   Expanded(
                     child: Container(
                         padding: EdgeInsets.only(right: 10),
                         width: MediaQuery.of(context).size.width / 1.20,
                         child: Text("SHIPMENT RECEIVED BY JNE COUNTER OFFICER AT [BANDUNG] (JNE:0975678987656) ",textAlign: TextAlign.left,)
                     ),
                   ),
                 ],
               ),

               Padding(padding: EdgeInsets.only(bottom: 10)),
             ],
           )
       )
     );

   }else{
     return Container();
   }
 }


  Widget metodePembayaran(){
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                Text("Metode Pembayaran",style: TextStyle(
                    fontWeight: FontWeight.bold
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 10)),
                Icon(Icons.payment),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width / 1.20,
                      child: Text("Bank BCA",textAlign: TextAlign.left,)
                  ),
                ),


              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    ) ;
  }

  Widget faktur(){
    if(widget.status == Config.StatusSelesai){
      return InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => FakturPesanan(idPesanan: _rincianPesan.id_pesanan.toString(),)));
          },
          child: Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width / 1.20,
                            child: Text("Faktur",textAlign: TextAlign.left,)
                        ),
                      ),
                      Text("LIAT FAKTUR",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink
                      ),textAlign: TextAlign.right,),
                      Padding(padding: EdgeInsets.only(right: 10)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )
      ) ;
    }
    return Container();

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
              "Rp. "+ hargaDiskonProduk[index],
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
        "Rp. "+ hargaProduks[index],
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
            "Rp. "+hargaJasas[index],
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
              "Rp. ${hargaDiskonJasa[index]}",
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

  //Widget List Produk
  Widget dataProduk(){
    return Container(
        child:   Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        child: Text("Data Barang",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ))
                    )
                ),
              ],
            ),
            namaJasa.length != 0 ?
            Container(
              height: 110,
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
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
                                                "x${jumlahJasa[index]}",
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
            ):
            Container(),
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
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
                                SizedBox(
                                  width: 10,
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
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )

    );
  }

  Widget ongkosKirim(){
    var ongkir = "JNT Rp. 15.000";
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                Text("Ongkos Kirim",style: TextStyle(
                    fontWeight: FontWeight.bold
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width / 1.20,
                      child: Text(ongkir,textAlign: TextAlign.left,)

                  ),
                ),


              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    ) ;
  }

  Widget kodeBayar(){
    var kodebayar = "652";
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10,top: 30)),
                Text("Kode Bayar",style: TextStyle(
                    fontWeight: FontWeight.bold
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width / 1.20,
                      child: Text(kodebayar,textAlign: TextAlign.left,)

                  ),
                ),


              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    ) ;
  }

  Widget noPesanan(){
    if(widget.status == Config.StatusBelumBayar){
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Nomor Pesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      )
                  ),

                  Expanded(
                      child: Container(
                        child: Text("DM22060001",textAlign: TextAlign.right),
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pemesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusDikemas){
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Nomor Pesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      )
                  ),

                  Expanded(
                      child: Container(
                        child: Text("DM22060001",textAlign: TextAlign.right),
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pemesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pembayaran",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusDikirim){
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Nomor Pesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      )
                  ),

                  Expanded(
                      child: Container(
                        child: Text("DM22060001",textAlign: TextAlign.right),
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pemesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pembayaran",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pengiriman",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(dateDikirim,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusSelesai ){
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Nomor Pesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      )
                  ),

                  Expanded(
                      child: Container(
                        child: Text("DM22060001",textAlign: TextAlign.right),
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pemesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pembayaran",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan ,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pengiriman",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(dateDikirim,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pesanan Selesai",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(dateSelesai,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusDibatalkan){
      return Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Nomor Pesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      )
                  ),

                  Expanded(
                      child: Container(
                        child: Text("DM22060001",textAlign: TextAlign.right),
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Pemesanan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(datePesanan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          child: Text("Waktu Dibatalkan",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Text(dateDibatalkan,textAlign: TextAlign.right,)
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else{
      return Container();
    }

  }

  //Button
  Widget buttonHubungiPenjual(){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child:
                FlatButton(
                  onPressed: (){
                    // getDataPegawai(context);
                  },
                  child: Text("Hubungi Penjual",style: TextStyle(color: Colors.pink),),
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.pink,
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(5)),
                )
            )
        ),
      ],
    );
  }

  Widget underline(BuildContext context){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width / 1.04,
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

  Widget buttonBatalkanPembelian(){
    if(namaProduk.length <= 0){
      return Container();
    }else{
      if(widget.status == Config.StatusDikemas){
        return Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: FlatButton(
                        onPressed: (){
                          showDialog(context: context,builder: (BuildContext context){
                            return new RadioButton();
                          });
//                        showDialog(
//                            context: context,
//                            child: new RadioButton());
//                        konfirmasiBatalPesanan();
                        },
                        color: Colors.pink[200],
                        textColor: Colors.white,
                        child: Text("Batalkan Pesanan")
                    )
                )
            ),
          ],
        );
      }else{
        return Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: FlatButton(
                      onPressed: (){
                        showDialog(context: context,builder: (BuildContext context){
                          return new RadioButton();
                        });
//                        konfirmasiBatalPesanan();
                      },
                      child: Text("Batalkan Pesanan",style: TextStyle(color: Colors.pink),),
                      shape: RoundedRectangleBorder(side: BorderSide(
                          color: Colors.pink,
                          width: 1,
                          style: BorderStyle.solid
                      ), borderRadius: BorderRadius.circular(5)),
                    )
                )
            ),
          ],
        );
      }
    }

  }

  Widget buttonUbahMetodePembayaran(){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child: FlatButton(
                  onPressed: (){
//                      setBankPenerima();
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Paying(id_pembayaran: _rincianPesan.id_pembayaran.toString())));
                  },
                  child: Text("Ubah Metode Pembayaran",style: TextStyle(color: Colors.pink),),
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.pink,
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(5)),
                )
            )
        ),
      ],
    );
  }

  Widget buttonBayarSekarang(){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => KonfirmasiPembayaran()));
                    },
                    color: Colors.pink[200],
                    textColor: Colors.white,
                    child: Text("Bayar Sekarang")
                )
            )
        ),
      ],
    );
  }

  Widget buttonRincianPembatalan(){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RincianPembatalan()));
                  },
                  child: Text("Rincian Pembatalan",style: TextStyle(color: Colors.pink),),
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.pink,
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(5)),
                )
            )
        ),
      ],
    );
  }

  Widget buttonBeliLagi(){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                    },
                    color: Colors.pink[200],
                    textColor: Colors.white,
                    child: Text("Beli Lagi")
                )
            )
        ),
      ],
    );
  }

  Widget buttonDikirim(){
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
            child: Container(
                child: FlatButton(
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AjukanPengembalian()));
                  },
                  child: Text("Ajukan Pengembalian",textAlign: TextAlign.center,style: TextStyle(color: Colors.pink),),
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.pink,
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(5)),
                )
            )
        ),
        Expanded(
            child: Container(
                child: FlatButton(
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
                            onPressed: () => Navigator.pop(context),
                            color: Colors.pink[200],
                          )
                        ],
                      ).show();
                    },
                    color: Colors.pink[200],
                    textColor: Colors.white,
                    child: Text("Pesanan Diterima")
                )
            )
        ),
      ],
    );
  }

  Widget buttonInfo(){
    if(widget.status == Config.StatusBelumBayar){
      return Card(
          child: Column(
            children: <Widget>[
              buttonHubungiPenjual(),
              buttonBatalkanPembelian(),
              buttonUbahMetodePembayaran(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusDikemas || widget.status == Config.StatusDikirim || widget.status == Config.StatusSelesai){
      return Card(
          child: Column(
            children: <Widget>[
              buttonHubungiPenjual(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else if(widget.status == Config.StatusDibatalkan){
      return Card(
          child: Column(
            children: <Widget>[
              buttonHubungiPenjual(),
              buttonRincianPembatalan(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
      ) ;
    }else{
      return Container();
    }

  }

  Widget buttonAksi(){
    if(widget.status == Config.StatusBelumBayar){
      return Card(
          child: Container(
              height: 60,
              child:  Column(
                children: <Widget>[
                  buttonBayarSekarang(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )

      ) ;
    }else if(widget.status == Config.StatusDikemas){
      return Card(
          child: Container(
              height: 60,
              child:  Column(
                children: <Widget>[
                  buttonBatalkanPembelian(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )
      ) ;
    }else if(widget.status == Config.StatusDikirim){
      return Card(
          child: Container(
              height: 60,
              child:   Column(
                children: <Widget>[
                  buttonDikirim(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )

      ) ;
    }else if(widget.status == Config.StatusSelesai || widget.status == Config.StatusDibatalkan){
      return Card(
          child:
          Container(
              height: 60,
              child:   Column(
                children: <Widget>[
                  buttonBeliLagi(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
          )
      ) ;
    }else{
      return Container();
    }

  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      //create appBar
      appBar: new AppBar(
        //warna background
        backgroundColor: Colors.pink[200],
        //judul
        title: new Text("Rincian Pesanan"),
        leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
          Navigator.pop(context);
        }),
        //bottom
      ),
      //source code lanjutan
      floatingActionButton: buttonAksi(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //buat body untuk tab viewnya
      body:
      new SingleChildScrollView(
        child:  new SafeArea(
            child: new Container(
              child: Column(
                children: <Widget>[
                  keterangan(),
                  alamatPengiriman(),
                  statusPengiriman(),
                  dataProduk(),
                  informasiPembayaran(),
                  faktur(),
                  metodePembayaran(),
                  noPesanan(),
                  buttonInfo(),
                  Padding(padding: EdgeInsets.only(bottom: 65)),
                ],
              ),
            )
        ),
      )

    );
  }
}

class RadioButton extends StatefulWidget {
  @override
  State createState() => new RadioButtonState();
}

class RadioButtonState extends State<RadioButton> {
  int radioKonfirmasiBatal = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget radioKonfirmasiPembatalan(String title,int value){
    return  RadioListTile(
      groupValue: radioKonfirmasiBatal,
      title: Text(title,style: TextStyle(
          fontSize: 15
      ),),
      value: value,
      activeColor: Colors.pink[200],
      onChanged: (val) {
        setState(() {
          radioKonfirmasiBatal = int.parse(val.toString());
        });
      },
    );
  }

  Widget underline(BuildContext context){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width / 1.04,
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

  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: EdgeInsets.only(top: 100),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        child: Text("Pilih Alasan Pembatalan",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),textAlign: TextAlign.center,)
                    )
                ),
                IconButton(icon: Icon(Icons.clear), onPressed: (){
                  Navigator.pop(context);
                })
              ],
            ),
            underline(context),
            radioKonfirmasiPembatalan("Ingin mengubah alamat pengiriman",1),
            radioKonfirmasiPembatalan("Ingin memasukkan / mengubah kode voucher",2),
            radioKonfirmasiPembatalan("Ingin mengubah pesanan(ukuran,warna,jumlah,dll)",3),
            radioKonfirmasiPembatalan("Tidak mudah melanjutkan pembayaran",4),
            radioKonfirmasiPembatalan("Menemukan harga yang lebih murah di toko lain",5),
            radioKonfirmasiPembatalan("Tidak ingin membeli lagi",6),
            radioKonfirmasiPembatalan("Lainnya",7),
            DialogButton(
              onPressed: () async {
                await Alert(context: context, title: "Success",type:AlertType.info, desc: "Berhasil Membatalkan Pesanan").show();
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoriIndex()));
              },
              child: Text(
                "KONFIRMASI",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.pink[200],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }
}
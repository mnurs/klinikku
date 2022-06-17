import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klinikku/home/home.dart';
import 'package:klinikku/model/Combobox.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KonfirmasiPembayaran extends StatefulWidget {
  @override
  _KonfirmasiPembayaranState createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  TextEditingController _namaPengirimController = TextEditingController();
  TextEditingController _noRekeningController = TextEditingController();
  Combobox _comboboxNamaBank = new Combobox("Pilih Bank","");

  List namaBank = ["BCA","BNI","Mandiri"];
  List gambarBank = ["img/bank/bca.png","img/bank/bni.png","img/bank/mandiri.png"];
  String transferBank = "";
  ImagePicker _picker = ImagePicker();
  XFile? image;
  String _IdGambar = "";
  String _ImageBuktiPembayaran = "";
//  int kodeUnik = 0;

  @override
  void initState() {
    super.initState();
//    getKodeUnik();
  }


  Widget listBankPenerima(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount:  2,
                itemBuilder: (BuildContext context, int index) {
                  var bank = index % 2 == 0 ? "BCA" : "BNI";
                  var nomor = index % 2 == 0 ? "9299239923" : "23234423";
                  var gambar = index % 2 == 0 ? "img/bank/bca.png" : "img/bank/bni.png";
                  var namaBank = "Bank ${bank} A.n Dwi wulansari (${nomor})";
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                borderOnForeground: true,
                                child: new InkWell(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.all(5.0),
                                      ),
                                      new Row(
                                        children: <Widget>[
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                          new Image.asset(
                                            gambar,
                                            fit: BoxFit.fitWidth,
                                            width: 80.0,
                                          ),
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                          Expanded(
                                              child: new Text(
                                                namaBank,
                                                style: TextStyle(fontSize: 15.0),
                                              )),
                                          new Icon(Icons.keyboard_arrow_right),
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                        ],
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.all(5.0),
                                      )
                                    ],
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      transferBank = namaBank;
                                    });

                                    Navigator.pop(context);
                                  },
                                )),
                          ),

                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  );

                },
              ),
            ),
          ],
        )

    );
  }

  Future<void> setBankPenerima() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Bank Penerima"),
          backgroundColor: Colors.pink[200],
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body:  new SingleChildScrollView(
          child:  new SafeArea(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    listBankPenerima()
                  ],
                ),
              )
          ),
        )

    );
    showDialog(context: context,builder: (context){
      return alert;
    });
  }



  Future<void> _openGallery(BuildContext context) async {
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() { });
    Navigator.pop(context);
  }

  Future<void> _openCamera(BuildContext context) async {
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() { });
    Navigator.pop(context);

  }
  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pilihlah"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGallery(context);

                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCamera(context);

                },
              ),
            ],
          ),
        ),
      );
    });
  }


  Widget listBank(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount:  namaBank.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                borderOnForeground: true,
                                child: new InkWell(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.all(5.0),
                                      ),
                                      new Row(
                                        children: <Widget>[
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                          new Image.asset(
                                            gambarBank[index],
                                            fit: BoxFit.fitWidth,
                                            width: 80.0,
                                          ),
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                          Expanded(
                                              child: new Text(
                                                namaBank[index],
                                                style: TextStyle(fontSize: 15.0),
                                              )),
                                          new Icon(Icons.keyboard_arrow_right),
                                          new Padding(
                                            padding: EdgeInsets.all(10.0),
                                          ),
                                        ],
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.all(5.0),
                                      )
                                    ],
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      _comboboxNamaBank = new Combobox(namaBank[index], namaBank[index]);
                                    });
                                    Navigator.pop(context);
                                  },
                                )),
                          ),

                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  );

                },
              ),
            ),
          ],
        )

    );
  }

  Future<void> setBank() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Bank"),
          backgroundColor: Colors.pink[200],
          leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: new SingleChildScrollView(
          child:  new SafeArea(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    listBank()
                  ],
                ),
              )
          ),
        )

    );
    showDialog(context: context,builder: (context){
      return alert;
    });
  }

  Widget underline(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
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

  Widget infoTransfer(){
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Text("Total Pembayaran",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                    )
                ),
                Expanded(
                    child: Container(
                        child: Text("Rp. 60.564",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink
                        ),textAlign: TextAlign.right,)
                    )
                ),
              ],
            ),
            underline(),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    flex: 9,
                    child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Text("Informasi Bank",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        child: Icon(Icons.keyboard_arrow_down)
                    )
                ),
              ],
            ),
            underline(),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Text("Pastikan anda telah melengkapi seluruh informasi sebelum upload bukti transfer. Auraderma akan memeriksa bukti anda dalam 24 jam.")
                    )
                ),
              ],
            ),
            underline(),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Text("Info Rek Bank :",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                    )
                ),
              ],
            ),
            underline(),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child:
                        InkWell(
                          child:
                          image == null ? Image.asset(
                          "img/upload.png",
                          fit: BoxFit.fitHeight,
                          height: MediaQuery.of(context).size.height / 8,
                          ):
                          Image.file(
                            File(image!.path),
                            fit: BoxFit.fitHeight,
                            height: MediaQuery.of(context).size.height / 8,
                          ),
                          onTap: (){
                            _showChoiceDialog(context);
                          },
                        )

                    )
                ),
              ],
            ),
            underline(),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child:  new Image.asset(
                        "img/contoh_struk_transfer.jpg",
                        fit: BoxFit.fitHeight,
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    )
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child:  Text("Contoh Foto untuk Transfer ATM")
                    )
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    );
  }

  Widget formTransfer(){
    return Card(
        child: Column(
          children: <Widget>[
            textBoxt("Nama Rekening Pengirim",_namaPengirimController,"Nama Lengkap",TextInputType.text),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            underline(),
            InkWell(
              onTap: (){
                setBank();
              },
              child: transfer("Transfer dari Bank",_comboboxNamaBank.child),
            ),

            Padding(padding: EdgeInsets.only(bottom: 10)),
            underline(),
            textBoxt("Masukkan No. Rekening Anda. Pembayaran melalui teller, isi dengan 9999",_noRekeningController,"1234567890",TextInputType.number),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            underline(),
            InkWell(
              child:  transfer("Transfer ke Bank ", transferBank == "" ? "Pilih Bank Penerima" : transferBank),
              onTap: (){
                setBankPenerima();
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            underline(),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Text("Jumlah Ditransfer (Rp.)",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                    )
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 10,top: 10),
                        child: Text("Rp. 60.564",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink
                        ),textAlign: TextAlign.right,)
                    )
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        )
    );
  }

  Widget tombolKirim(){
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child:
                    FlatButton(
                        color: Colors.pink[200],
                        textColor: Colors.white,
                        onPressed:(){
                            KonfirmasiPembayaran();
                        },
                        child: Text("KIRIM")
                    )
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
              ],
            ),
          ],
        )
    );
  }

  Widget textBoxt(String label,TextEditingController _controller,String hint,TextInputType inputType){
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
            )

        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10,top: 10),
              child: TextField(
                controller: _controller,
                style: TextStyle(
                    fontSize: 15
                ),
                keyboardType: inputType,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint
                ),
              ),
            )

        ),
      ],
    );
  }

  Widget transfer(String label,String hint){
    return Row(
      children: <Widget>[
        Expanded(
            child:  Container(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
            )
        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10,top: 10),
              child:  Text(
                hint,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            )

        ),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Konfirmasi Pembayaran"),
          backgroundColor: Colors.pink[200],
          leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()),(Route<dynamic> route) => false);
          }),
        ),
        body:  new SingleChildScrollView(
          child:  new SafeArea(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    infoTransfer(),
                    formTransfer(),
                    tombolKirim()
                  ],
                ),
              )
          ),
        )
    );
  }
}

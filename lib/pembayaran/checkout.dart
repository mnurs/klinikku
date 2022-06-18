import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/home/home.dart';
import 'package:klinikku/model/Combobox.dart';
import 'package:klinikku/pembayaran/after_checkout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'package:responsive_container/responsive_container.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _jumlahProduk = 0;
  double subTotal = 0;
  double _grandTotal = 0;
  double totalBerat = 0;
  double _diskon = 0;

  final catatanController = TextEditingController();

  int _rgCheckout = 1;
  String _selectedValue = "";
  String transferBank = "";

  bool visibleOnline = false;
  bool visibleCabang = false;
  bool visibleCOD = false;

  DateTime _currentDate = DateTime.now();

  int kodeUnik = 0;

  Combobox _comboboxCabang = new Combobox("Pekalongan","PK");
  List<Combobox> _listCabang = [new Combobox("Pekalongan","PK"),new Combobox("Smarang","SN"),new Combobox("Solo","SL")];

  List diskonProduk = [0];
  List namaProduk = ["Day Cream"];
  List hargaProduks = ["60.000"];
  List hargaDiskonProduk = ["0"];
  List gambarProduk = ["img/produk/1.jpg"];
  List jumlahProduk = [1];
  List diskonJasa = [];
  List namaJasa = [];
  List hargaJasas = [];
  List hargaDiskonJasa = [];
  List gambarJasa = [];
  List jumlahJasa = [];

  Widget detailAlamatPengiriman(){
    var alamatWilayah = "";
    var namaPenerima = "Ahmad Yani";
    var noTelepon = 0872323232436;

    return   new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
            Text( namaPenerima),
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
            Text(noTelepon != null ? "("+ noTelepon.toString() +")" : "")
          ],
        ),
        new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                 "Jl. Fatmawati Raya No 4 RT 06 RW 03 Jakarta Selatan, Indonesia 15431 Fatmawati Festival Blok A-7",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        new Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Row(children: <Widget>[
          Expanded(
              child: Divider(
                thickness: 2.0,
              )),
        ])
      ],
    ) ;
  }
  Widget alamatPengiriman(String label){

    return new Container(
        color: Colors.pink[200],
        child: InkWell(
          onTap: (){
            // Navigator.push(context,  MaterialPageRoute(builder: (context) => AlamatList()));
          },
          child:  Card(
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Expanded(
                      flex: 10,
                      child:  Text(
                        label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),

                    new Container(
                      height: 15.0,
                      width: 35.0,
                      color: Colors.transparent,
                      child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: new BorderRadius.only(
                                topLeft:
                                const Radius.circular(40.0),
                                topRight:
                                const Radius.circular(40.0),
                                bottomLeft:
                                const Radius.circular(40.0),
                                bottomRight:
                                const Radius.circular(40.0),
                              )),
                          child: new Center(
                            child: new Text(
                              "Utama",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0),
                            ),
                          )),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      size: 40.0,
                    )
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                detailAlamatPengiriman()
              ],
            ),
          ),
        )


    );


  }

  Widget pilihCabang(){
    var _value = _listCabang.isEmpty
        ? _comboboxCabang
        : _listCabang.firstWhere((item) => item.value == _comboboxCabang.value, orElse: () => new Combobox("Pekalongan", "PK"));
    return   new Card(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10.0)),
              new Text("Ambil di Cabang"),
              new Padding(
                padding: EdgeInsets.only(left: 45.0),
              ),
              Expanded(
                child: new Container(
                  color: Colors.white,
                  child: new DropdownButtonHideUnderline(
                      child: new DropdownButton<Combobox>(
                        isDense: false,
                        isExpanded: true,
                        hint:  Text("Select item"),
                        value: _value,
                        onChanged: (value) {
                        },
                        items: _listCabang.map((Combobox combobox) {
                          return new DropdownMenuItem<Combobox>(
                              value: combobox,
                              child: Text(combobox.child)
                          );
                        }).toList(),
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 10.0)),
            ],
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
                  thickness: 2.0,
                )),
          ])
        ],
      ),
    );
  }

  //Widget Harga Produk
  Widget hargaProduk(int index){
    if(diskonProduk[index] > 0){
      return Row(
        children: <Widget>[
          new Text(
            "Rp. ${hargaProduks[index]}",
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
              "Rp. ${hargaDiskonProduk[index]}",
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
            "Rp. ${hargaJasas[index]}",
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
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                                  Image.network(
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
                                          namaJasa[index],
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
                                                  "${jumlahJasa[index]}",
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
              namaProduk.length != 0 ?
              Flexible(
                child: Container(
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

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ):
              Container(),

            ],
          ),
        )

    );
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? _selDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (_selDate != null && _selDate != _currentDate)
      setState(() {
        _currentDate = _selDate;
      });
  }

  //Widget Tanggal Pengambilan
  Widget tanggalPengambilan(){
    String _showFormattedDate = new DateFormat('dd MMMM yyyy').format(_currentDate);
    return new Container(
        color: Colors.pink[200],
        height: 80.0,
        child: Card(
          child: new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text(
                "Tanggal Pengambilan",
              ),
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Expanded(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$_showFormattedDate"),
                    FloatingActionButton(
                      backgroundColor: Colors.pink[200],
                      elevation: 5,
                      child: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }

  //Widget Voucher
  Widget voucher(){
    return new Container(
        color: Colors.pink[200],
        height: 80.0,
        child: Card(
          child: new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text(
                "Voucher",
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Container(
                height: 30.0,
                // width: 220.0,
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      "Masukkan Kode Voucher",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[200]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }

  //Widget Kurir
  Widget kurir(){
    var kirirPengiriman = "Pilih Kurir Pengiriman";
    return  new Card(
      // height: 70.0,
      child: InkWell(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                new Text(
                  "Kurir",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                new Text(
                    kirirPengiriman),
//                    "JNE REG - Rp. 10.000 (3 Hari Kerja)"),
                Expanded(
                  child: new SizedBox(
                    width: 20.0,
                  ),
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  size: 40.0,
                )
              ],
            )
          ],
        ),
        onTap: () {

        },
      ),
    );
  }


  //Widget catatan
  Widget catatan(){
    return  new Card(
      // height: 70.0,
      child: InkWell(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                new Text(
                  "Catatan",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: new TextFormField(
                controller: catatanController,
                onChanged: (value) {

                } ,
                decoration: new InputDecoration(
                    hintText: 'Night Cream A/B'),
              ),
            )
          ],
        ),
        onTap: () {
          setState(() {
            // Navigator.push(context,  MaterialPageRoute(builder: (context) => Courier(id_wilayah:dataAlamatPelanggan['kabupaten'].toString(),totalBerat: totalBerat.ceil().toString(),)));
          },
          );
        },
      ),
    );
  }

  //Widget Metode Pembayaran
  Widget metodePembayaran(){
    return new Card(
      // height: 70.0,
      child: InkWell(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                new Text(
                  "Metode Pembayaran",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),

                Expanded(
                    child: Container(
                      child:new Text(transferBank == "" ? "Pilih Bank Penerima" : transferBank,overflow: TextOverflow.ellipsis,),
                    )
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  size: 40.0,
                )
              ],
            )
          ],
        ),
        onTap: () {
          setBankPenerima();
        },
      ),
    );
  }

  Widget grandTotal(){
    return  new Card(
      // height: 100.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          new Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text("Sub total (2 items)"),
              Expanded(
                child: new SizedBox(
                  width: 20.0,
                ),
              ),
              new Text("60.000"),
              new Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),
          new Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text("Est. Biaya Pengiriman"),
              Expanded(
                child: new SizedBox(
                  width: 20.0,
                ),
              ),
              new Text("0"),
              new Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),

          new Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text("Kode Bayar"),
              Expanded(
                child: new SizedBox(
                  width: 20.0,
                ),
              ),
              new Text("562"),
              new Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),
          new Divider(),
          new Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              new Text(
                "Grand Total",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Expanded(
                child: new SizedBox(
                  width: 20.0,
                ),
              ),
              new Text(
                "60.562",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              new Padding(
                padding: EdgeInsets.only(right: 10.0),
              )
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          )
        ],
      ),
    );
  }

  Widget underlineBankPenerima(){
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

  Widget totalTagihanBankPenerima(){
    return  new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
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
                  new Text("Total Tagihan"),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: new Text(
                      _grandTotal.toString(),
                      style: TextStyle(
                          color: Colors.orange[400],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
//                  new Text("Detail"),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
              new Text("60.562"),
            ],
          ),
          onTap: () {},
        ));
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
          title: Text("Pilih Metode Pembayaran"),
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
                    totalTagihanBankPenerima(),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        new Text(
                          "Metode Pembayaran",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
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


  visibleForm() {
    if (_selectedValue == null) {
      setState(() {
        visibleOnline = true;
        visibleCabang = false;
        visibleCOD = false;
      });
    } else if (_selectedValue == "Kirim Online") {
      setState(() {
        visibleOnline = true;
        visibleCabang = false;
        visibleCOD = false;
      });
    }
    else if (_selectedValue == "Ambil Di Cabang") {
     setState(() {
       visibleOnline = false;
       visibleCabang = true;
       visibleCOD = false;
     });
   }
  }

  final List<RadioGroup> _rgCheckoutList = [
    RadioGroup(index: 1, text: "Kirim Online",value:"dikirim"),
    RadioGroup(index: 2, text: "Ambil Di Cabang (Segera)",value:"datang"),
//    RadioGroup(index: 3, text: "COD",value:"cod"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = "Kirim Online";
    visibleForm();
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Future<void> cancelCheckout() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()),(Route<dynamic> route) => false);
  }

  showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  prosesLakukanPesanan() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  AfterCheckout()));
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.pink[200],
        leading:  IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.warning,
                title: "Warning",
                desc: "Apakah ingin membatalkan pesanan?",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Tidak",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.red,
                  ),
                  DialogButton(
                    child: Text(
                      "Ya",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      await cancelCheckout();
                    }
                    ,
                    color: Colors.blue,
                  )
                ],
              ).show();
            }),
//          ReusableAppbar.getAppBar("Checkout", Colors.pink[200],context)
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Lakukan Pembayaran",
        elevation: 5.0,
        backgroundColor: Colors.white,
        // icon: const Icon(Icons.add),
        label: const Text('Lakukan Pembayaran',style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: () async {
            await prosesLakukanPesanan();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: new SingleChildScrollView(
        child: new SafeArea(
          child: new Container(
            color: Colors.pink[200],
            child: new Column(
              children: <Widget>[
                new Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0,top: 10.0),
                            child: new Text(
                              'Pilih Cara Pengambilan :',
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                      _buildRadioButton(),
                      SizedBox(
                        height: 5,
                      ),
                      new Divider(height: 5.0, color: Colors.black),
                    ],
                  ),
                ) ,
                // Online
                Visibility(
                  visible: visibleOnline,
                  child: Column(
                    children: <Widget>[
                      // Alamat
                      alamatPengiriman("Alamat Pengiriman"),
                      catatan(),
                      // List Barang
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            new Row(
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                ),
                                new Text(
                                  "Daftar Barang",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            dataProduk(),
                          ],
                        ),
                      ),

                      // Voucher
                      voucher(),
                      // Kurir
                      kurir() ,
                      // Metode Pembayaran
                      metodePembayaran(),
                      // Total
                      grandTotal(),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 80.0),
                      ),
                    ],
                  ),
                ),

                // Cabang
                 Visibility(
                   visible: visibleCabang,
                   child: Column(
                     children: <Widget>[
                       // Pilih Cabang Mana
                       pilihCabang(),
                       //Tanggal Pengambilan
                       tanggalPengambilan(),
                       catatan(),
                       // List Barang
                       new Card(
                         child: new Column(
                           children: <Widget>[
                             new Padding(
                               padding: EdgeInsets.only(top: 20.0),
                             ),
                             new Row(
                               children: <Widget>[
                                 new Padding(
                                   padding: EdgeInsets.only(left: 10.0),
                                 ),
                                 new Text(
                                   "Daftar Barang",
                                   style: TextStyle(
                                       fontSize: 25.0,
                                       fontWeight: FontWeight.bold),
                                 ),
                               ],
                             ),
                             dataProduk(),
                           ],
                         ),
                       ),
                       // Voucher
                       voucher(),

                       // Metode Pembayaran
                       metodePembayaran(),
                       // Total
                       grandTotal(),
                       new Padding(
                         padding: EdgeInsets.only(bottom: 80.0),
                       ),
                     ],
                   ),
                 ),

                // COD
//                Visibility(
//                  visible: visibleCOD,
//                  child: Column(
//                    children: <Widget>[
//                      // Text("COD"),
//                      // Alamat
//                      alamatPengiriman("Alamat Cash On Delivery"),
//                      // List Barang
//                      new Card(
//                        child: new Column(
//                          children: <Widget>[
//                            new Padding(
//                              padding: EdgeInsets.only(top: 20.0),
//                            ),
//                            new Row(
//                              children: <Widget>[
//                                new Padding(
//                                  padding: EdgeInsets.only(left: 10.0),
//                                ),
//                                new Text(
//                                  "Daftar Barang",
//                                  style: TextStyle(
//                                      fontSize: 25.0,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ],
//                            ),
//                            dataProduk(),
//                          ],
//                        ),
//                      ),
//                      // Voucher
//                      voucher(),
//                      metodePembayaran(),
//                      // Total
//                      grandTotal(),
//                      new Padding(
//                        padding: EdgeInsets.only(bottom: 80.0),
//                      ),
//                    ],
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget _buildRadioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _rgCheckoutList
          .map((checkout) => Row(
        children: <Widget>[
          Radio(
            value: checkout.index,
            groupValue: _rgCheckout,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) {
              _selectedValue = int.parse(value.toString()) == 2 ? "Ambil Di Cabang" : "Kirim Online";
              _rgCheckout = int.parse(value.toString());
              setState(() {
              });
              visibleForm();
            },
          ),
          Text(checkout.text),
        ],
      ))
          .toList(),
    );
  }
}

class RadioGroup {
  final int index;
  final String text;
  final String value;
  RadioGroup({required this.index,required  this.text, required this.value});
}

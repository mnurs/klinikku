import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/auth/login.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/home/home.dart';
import 'package:klinikku/model/Combobox.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Pendaftaran extends StatefulWidget {
  @override
  _PendaftaranState createState() => _PendaftaranState();
}

class _PendaftaranState extends State<Pendaftaran> {
  bool isUpdate = false;
  bool isSave = true;

  String _statusRadio = "nikah";
  String _JenisKelaminRadio = "Wanita";
  String cabangPengambilan = "";
  String statusPasien = "baru";
  String tanggalRegistrasi = new DateTime.now().toString();
  TextEditingController _nomorktpController = TextEditingController();
  TextEditingController _namaLengkapController = TextEditingController();
  TextEditingController _namaPenggilanController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  Combobox _agama = new Combobox("Atur Agama","");
  Combobox _pekerjaan = new Combobox("Atur Pekerjaan","");
  Combobox _tempatLahir = new Combobox("Atur Tempat Lahir","");
  Combobox _kota = new Combobox("Atur Kota","");
  bool IsAlergi = false;

  DateTime _currentDate = DateTime.now();

  List<String> _listPekerjaan = ["Supir","Ibu Rumah Tangga","Buruh","Tukang Sapu"];
  List<String> _listkota = ["Jakarta","Jawa Barat","Jawa Tengah","Jawa Timur"];
  List<String> _listtempatLahir = ["Jakarta","Jawa Barat","Jawa Tengah","Jawa Timur"];



  @override
  void initState() {
    super.initState();
    if(Config.isAkun){
      _nomorktpController.text = "330518180000001" ;
      _namaLengkapController.text = "Irwan Waluyo";
      _namaPenggilanController.text = "Irwan";
      _emailController.text = "IrwanWaluyo@gmail.com";
      _nomorTeleponController.text = "087623422686";
      _alamatController.text = "Surakarta, Jawa Tengah";
      _agama = new Combobox("Islam","islam");
      _pekerjaan = new Combobox("Supir","Supir");
      _tempatLahir = new Combobox("Jakarta","Jakarta");
      _kota = new Combobox("Jakarta","Jakarta");
      setState(() { });
    }
  }

  saveOrUpdate() async {
    Config.isLogin = true;
    setState(() {});
    await Alert(context: context, title: "Success",type:AlertType.info, desc: "Berhasil Daftar").show();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget listAgama(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
                child: Column(
                  children: <Widget>[
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Islam","islam");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Islam",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Kristen","kristen");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Kristen",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Katolik","katolik");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Katolik",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Hindu","hindu");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Hindu",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Buddha","buddha");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Buddha",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    underline(),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child:
                            InkWell(
                                onTap: ()  async {
                                  setState(() {
                                    _agama= new Combobox("Kong Hu Cu","konghucu");
                                  });
                                  Navigator.pop(context);
                                },
                                child:Container(
                                    child: Text("Kong Hu Cu",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                )
                            )

                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                )
            ),
          ],
        )

    );
  }

  Future<void> setAgama() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Agama"),
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
                    listAgama()
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

  Widget listPekerjaan(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount:  _listPekerjaan.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      underline(),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                              child:
                              InkWell(
                                  onTap: ()  async {
                                    setState(() {
                                      _pekerjaan = new Combobox(_listPekerjaan[index],_listPekerjaan[index]);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child:Container(
                                      child: Text(_listPekerjaan[index],style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                  )
                              )

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

  Future<void> setPekerjaan() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Pekerjaan" ),
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
                    listPekerjaan()
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

  Future<void> setTempatLahir() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Tempat Lahir" ),
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
                    listTempatLahir()
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

  Future<void> setKota() async {
    var alert= Scaffold(
        appBar: AppBar(
          title: Text("Pilih Kota" ),
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
                    listKota()
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

  Widget listTempatLahir(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount:  _listtempatLahir.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      underline(),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                              child:
                              InkWell(
                                  onTap: ()  async {
                                    setState(() {
                                      _tempatLahir = new Combobox(_listtempatLahir[index],_listtempatLahir[index]);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child:Container(
                                      child: Text(_listtempatLahir[index],style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                  )
                              )

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

  Widget listKota(){
    return Container(
        child:   Column(
          children: <Widget>[
            Container(
              child: new ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount:  _listkota.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      underline(),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                              child:
                              InkWell(
                                  onTap: ()  async {
                                    setState(() {
                                      _kota = new Combobox(_listkota[index],_listkota[index]);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child:Container(
                                      child: Text(_listkota[index],style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ))
                                  )
                              )

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

  setTextBox(String value,TextEditingController setValue){
    if(value != null){
      setState(() { setValue.text = value; }) ;
      return value;
    }
    setState(() {  setValue.text = ""; }) ;
    return "";
  }

  Widget underline(){
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

  Widget textBoxt(String label,TextEditingController _controller,String hint){
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(label,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            style: TextStyle(
                fontSize: 15
            ),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint
            ),
          ),
        ),
      ],
    );
  }

  Widget wilayah(String label,String hint){
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(label,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            hint,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),
        Icon(Icons.arrow_forward_ios)
      ],
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

  Widget formInputAlamat(){
    String _showFormattedDate = new DateFormat('dd MMMM yyyy').format(_currentDate);
    return SafeArea(
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            children: <Widget>[
              textBoxt(
                  "Nomor KTP",
                  _nomorktpController,
                  "Atur Nomor KTP"
              ),
              underline(),
              textBoxt(
                  "Nama Lengkap",
                  _namaLengkapController,
                  "Atur Nama Lengkap"
              ),
              underline(),
              textBoxt(
                  "Nama Panggilan (optional)",
                  _namaPenggilanController,
                  "Atur Nama Panggilan (optional)"
              ),
              underline(),
              new Text(
                'Jenis Kelamin ',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: "Pria",
                    groupValue: _JenisKelaminRadio,
                    onChanged: (value){
                      setState(() {
                        _JenisKelaminRadio = "Pria";
                      });
                    },
                  ),
                  new Text(
                    'Pria',
                  ),
                  new Radio(
                    value: "Wanita",
                    groupValue: _JenisKelaminRadio,
                    onChanged: (value){
                      setState(() {
                        _JenisKelaminRadio = "Wanita";
                      });
                    },
                  ),
                  new Text(
                    'Wanita',
                  ),
                ],
              ),
              underline(),
              textBoxt(
                  "Email (Optional)",
                  _emailController,
                  "Atur Email (Optional)"
              ),
              underline(),
              SizedBox(height: 10.0,),
              InkWell(
                onTap: (){
                  setTempatLahir();
                },
                child: wilayah(
                  "Tempat Lahir (Optional)",
                   _tempatLahir.child

                ),
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),
              Text("Tanggal Lahir",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("$_showFormattedDate",textAlign: TextAlign.right,
                        ),
                      )
                  ),

                  FloatingActionButton(
                    backgroundColor: Colors.pink[200],
                    elevation: 5,
                    child: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),
              textBoxt(
                  "No. Telp",
                  _nomorTeleponController,
                  "Atur No Telepon"
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),
              new Text(
                'Status',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: "nikah",
                    groupValue: _statusRadio,
                    onChanged: (value){
                      setState(() {
                        _statusRadio = "nikah";
                      });
                    },
                  ),
                  new Text(
                    'Nikah',
                  ),
                  new Radio(
                    value: "belum nikah",
                    groupValue: _statusRadio,
                    onChanged: (value){
                      setState(() {
                        _statusRadio = "belum nikah";
                      });
                    },
                  ),
                  new Text(
                    'Belum Nikah',
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),

              InkWell(
                onTap: (){
                  setAgama();
                },
                child: wilayah(
                    "Agama (Optional)",
                    _agama.child
                ),
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),

              InkWell(
                onTap: (){
                  setPekerjaan();
                },
                child: wilayah(
                    "Pekerjaan (Optional)",
                    _pekerjaan.child
                ),
              ),
              SizedBox(height: 10.0,),
              underline(),
              SizedBox(height: 10.0,),

              InkWell(
                onTap: (){
                  setKota();
                },
                child: wilayah(
                    "Kota",
                    _kota.child
                ),
              ),
              underline(),
              SizedBox(height: 10.0,),
              Text("Alamat Lengkap",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _alamatController,
                style: TextStyle(
                    fontSize: 15
                ),
                decoration: InputDecoration(
                  hintText: "Atur Alamat Lengkap",
                  border: InputBorder.none,
                ),
              ),
              underline(),
              SizedBox(height: 10.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text("Apakah Anda Alergi Obat"),
                  ),
                  Expanded(
                    flex: 2,
                    child: Switch(
                      value: IsAlergi,
                      onChanged: (value) {
                        setState(() {
                          IsAlergi = value;
                        });
                      },
                      activeTrackColor: Colors.pink[100],
                      activeColor: Colors.pink,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child:
                      FlatButton(
                          disabledColor:  Colors.pink[100],
                          color: Colors.pink[200],
                          textColor: Colors.white,
                          onPressed:(){
                            if(isSave){
                              setState(() {
                                isSave = false;
                              });
                                saveOrUpdate();
                            }
                          },
                          child: Text("KIRIM")
                      )
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.id_pelanggan != null){
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Ubah Data Diri"),
    //       backgroundColor: Colors.pink[200],
    //       leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:() {
    //         Navigator.pop(context);
    //       }),
    //     ),
    //     body: RefreshIndicator(
    //         onRefresh: cekData,
    //         child:FutureBuilder<void>(
    //           future:  pelangganFuture,
    //           builder: (context,snapshot) {// AsyncSnapshot<Your object type>
    //             if( snapshot.connectionState == ConnectionState.waiting){
    //               return  Center(child: Text('Loading...'));
    //             }else{
    //               if (snapshot.hasError){
    //                 return Center(child: Text('Error: ${snapshot.error}'));
    //               }
    //               else{
    //                 if(dataPelanggan == null){
    //                   return new Container(
    //                     child: Text('Tidak Ada Data...'),
    //                   );
    //                 }else{
    //                   return formInputAlamat();
    //                 }
    //               }
    //
    //             }
    //           },
    //         )
    //     ),
    //   );
    // }else{
      return Scaffold(
          appBar: AppBar(
            title: Text("Pendaftaran"),
            backgroundColor: Colors.pink[200],
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:() {
              Navigator.pop(context);
            }),
          ),
          body:  formInputAlamat()
      );
    }
  // }
}
//
// class WilayahContent extends StatefulWidget {
//   final String status;
//
//   WilayahContent({
//     this.status,
//   });
//
//   @override
//   _WilayahContentState createState() => new _WilayahContentState();
// }
//
// class _WilayahContentState extends State<WilayahContent> {
//   Wilayah _wilayah = new Wilayah();
//   List<Wilayah> _listWilayah = new List();
//   List<Wilayah> _listWilayahResult = new List();
//   Map _dataWilayah = null;
//
//   TextEditingController _cariWilayahController = TextEditingController();
//
//   @override
//   void initState(){
//     super.initState();
//   }
//
//
//   Future<void> onSearchTextChanged(String text) async {
//     _listWilayahResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }
//
//     _listWilayah.forEach((wilayah) {
//       if (wilayah.nama.toUpperCase().contains(text.toUpperCase()))
//         _listWilayahResult.add(wilayah);
//     });
//     setState(() {});
//   }
//
//   Future<void> getWilayah()  async {
//     try{
//       var url = StoragePrefix.BaseUrl + StoragePrefix.UrlListWilayahByLevel + "3";
//       setState(() {
//         _dataWilayah = null;
//         _listWilayah = new List();
//         _listWilayahResult = new List();
//         _cariWilayahController.text = "";
//       });
//       await Service.Get(url).then((response){
//         if(response.statusCode == 200){
//           _dataWilayah = json.decode(response.body);
//           for(var item in _dataWilayah["data"]){
//             _wilayah = new Wilayah.fromJson(item);
//             _listWilayah.add(_wilayah);
//           }
//         }
//       });
//     }catch(error){
//       print(error);
//     }
//   }
//
//   Widget underline(){
//     return  Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Container(
//           height: 10,
//           width: MediaQuery.of(context).size.width / 1.07,
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide( //                   <--- left side
//                 color: Colors.black12,
//                 width: 1.0,
//               ),
//             ),
//           ),
//         ) ,
//       ],
//     );
//   }
//
//   Widget listWilayah(List<Wilayah> list,String statusWilayah){
//     return Container(
//         child:   Column(
//           children: <Widget>[
//             Container(
//               child: new ListView.builder(
//                 primary: false,
//                 shrinkWrap: true,
//                 itemCount:  list == null ? 0 : list.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: <Widget>[
//                       underline(),
//                       Padding(padding: EdgeInsets.only(bottom: 10)),
//                       Row(
//                         children: <Widget>[
//                           Padding(padding: EdgeInsets.only(left: 10)),
//                           Expanded(
//                               child:
//                               InkWell(
//                                   onTap: ()  async {
//                                     if(statusWilayah == StoragePrefix.WilayahKabupaten_Kota){
//                                       setState(() {
//                                         StoragePrefix.ComboboxKota = new Combobox(list[index].nama,list[index].id_wilayah.toString());
//                                       });
//                                     }else{
//                                       setState(() {
//                                         StoragePrefix.ComboboxTempatLahir  = new Combobox(list[index].nama,list[index].id_wilayah.toString());
//                                       });
//                                     }
//                                     Navigator.pop(context);
//                                   },
//                                   child:Container(
//                                       child: Text(list[index].nama,style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ))
//                                   )
//                               )
//
//                           ),
//                         ],
//                       ),
//                       Padding(padding: EdgeInsets.only(bottom: 10)),
//                     ],
//                   );
//
//                 },
//               ),
//             ),
//           ],
//         )
//
//     );
//   }
//
//   _getContent(){
//     return Scaffold(
//         appBar: AppBar(
//           title:  TextField(
//             controller: _cariWilayahController,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//                 hintText: 'Cari ',
//                 hintStyle: TextStyle(color: Colors.white),
//                 prefixIcon: Icon(Icons.search,color: Colors.white,),
//                 labelStyle: new TextStyle(color: Colors.white),
//                 border: new UnderlineInputBorder(
//                     borderSide: new BorderSide(
//                         color: Colors.white
//                     )
//                 )
//             ),
//             onChanged: (value){
//               onSearchTextChanged(value);
//             },
//           ),
//           backgroundColor: Colors.pink[200],
//           leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
//             Navigator.pop(context);
//           }),
//           actions: <Widget>[
//             new IconButton(
//               icon: new Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 _cariWilayahController.clear();
//                 onSearchTextChanged('');
//               },
//             ),
//           ],
//         ),
//         body:  _listWilayahResult.length != 0 || _cariWilayahController.text.isNotEmpty ?
//         new SingleChildScrollView(
//           child:  new SafeArea(
//               child: new Container(
//                 child: Column(
//                   children: <Widget>[
//                     listWilayah(_listWilayahResult,widget.status)
//                   ],
//                 ),
//               )
//           ),
//         ) :
//         FutureBuilder<void>(
//           future: getWilayah(),
//           builder: (context,snapshot) {// AsyncSnapshot<Your object type>
//             if( snapshot.connectionState == ConnectionState.waiting){
//               return  Center(child: Text('Loading...'));
//             }else{
//               if (snapshot.hasError){
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               else{
//                 if (_listWilayahResult.length  <= 0 && _listWilayah.length <= 0) {
//                   return new Container(
//                     child: Center(
//                         child: Text('Tidak Ada Data...')
//                     ) ,
//                   );
//                 }else{
//                   return
//                     new SingleChildScrollView(
//                       child:  new SafeArea(
//                           child: new Container(
//                             child: Column(
//                               children: <Widget>[
//                                 listWilayah(_listWilayah,widget.status)
//                               ],
//                             ),
//                           )
//                       ),
//                     );
//                 }
//               }
//             }
//           },
//         )
//
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _getContent();
//   }
// }
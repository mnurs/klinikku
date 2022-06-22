import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/konsultasi/room_chat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class JenisKulit {
  int id;
  String text;

  JenisKulit({required this.id, required this.text });

  static List<JenisKulit> getJenisKulit() {
    return <JenisKulit>[
      JenisKulit(id: 1, text: "Kering"),
      JenisKulit(id: 2, text: "Normal"),
      JenisKulit(id: 3, text: "Berminyak"),
      JenisKulit(id: 4, text: "Kombinasi"),
    ];
  }
}

class Optional {
  int id;
  String text;

  Optional({required this.id, required this.text });

  static List<Optional> getOptional() {
    return <Optional>[
      Optional(id: 1, text: "Ya"),
      Optional(id: 2, text: "Tidak"),
    ];
  }
}
var defaultNrm = "";
var defaultUserName = "";
var defaultDokterName = "";
var defaultPasienName = "";
var defaultUserId = "";


class PertanyaanIndex extends StatefulWidget {
  @override
  PertanyaanIndexState createState() => PertanyaanIndexState();
}

class PertanyaanIndexState extends State<PertanyaanIndex> {


  TextEditingController _hamilController = new TextEditingController();
  TextEditingController _keluhanController = new TextEditingController();
  TextEditingController _pemakaianProdukController = new TextEditingController();

  bool isHamil = false;
  bool isMenyusui = false;
  bool isKulitMerah = false;
  bool isAlergiObat = false;

  late List<JenisKulit> jeniskulits;
  late JenisKulit selectedJenisKulit;

//Foto Depan
  ImagePicker _futureImageFotoDepan = ImagePicker();
  XFile? imageFileFotoDepan;

//Foto Kiri
  ImagePicker _futureImageFotoKiri = ImagePicker();
  XFile? imageFileFotoKiri;

//Foto Kanan
  ImagePicker _futureImageFotoKanan = ImagePicker();
  XFile? imageFileFotoKanan;

//Bermasalah
  ImagePicker _futureImageFotoBermasalah = ImagePicker();
  XFile? imageFileFotoBermasalah;

  @override
  void initState() {
    super.initState();
    jeniskulits = JenisKulit.getJenisKulit();
    selectedJenisKulit = new JenisKulit(id: 1, text: "Kering");

  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  setSelectedJenisKulit(JenisKulit jenisKulit) {
    setState(() {
      selectedJenisKulit = jenisKulit;
    });
  }

//  setSelectedHamil(Optional optional) {
//    setState(() {
//      selectedHamil = optional;
//    });
//  }

  setHamil(bool optional) {
    setState(() {
      isHamil = optional;
    });
  }

//  setSelectedMenyusui(Optional optional) {
//    setState(() {
//      selectedMenyusui = optional;
//    });
//  }

  setMenyusui(bool optional) {
    setState(() {
      isMenyusui = optional;
    });
  }


//  setSelectedKulitMerah(Optional optional) {
//    setState(() {
//      selectedKulitMerah = optional;
//    });
//  }

  setKulitMerah(bool optional) {
    setState(() {
      isKulitMerah = optional;
    });
  }

//  setSelectedAlergiObat(Optional optional) {
//    setState(() {
//      selectedAlergiObat = optional;
//    });
//  }

  setAlergiObat(bool optional) {
    setState(() {
      isAlergiObat = optional;
    });
  }

  List<Widget> createRadioListJenisKulit() {
    List<Widget> widgets = [];
    for (JenisKulit jenisKulit in jeniskulits) {
      widgets.add(
          SizedBox(
            height: 30.0,
            child: RadioListTile(
              dense: true,
              value: jenisKulit,
              groupValue: selectedJenisKulit,
              title: Text(jenisKulit.text,style: TextStyle(fontSize: 16)),
              onChanged: (currentJenisKulit) {
                // setSelectedJenisKulit(currentJenisKulit);
              },
              selected: selectedJenisKulit == jenisKulit,
              activeColor: Colors.green,
            ),
          )
      );

    }
    return widgets;
  }

//  List<Widget> createRadioListHamil() {
//    List<Widget> widgets = [];
//    for (Optional optional in hamils) {
//      widgets.add(
//        Row(
//          children: <Widget>[
//            Checkbox(
//              value: isHamil,
//              onChanged: (value) {
//
//              },
//            ),
//            Text("Sedang Hamil")
//          ],
//        )
//
////        CheckboxListTile(
////          title: Text(optional.text),
////          value: true,
////          activeColor: Colors.green,
////          onChanged: (currentHamil) {
//////            setSelectedHamil(currentHamil);
////          },
////        ),
////        RadioListTile(
////          value: optional,
////          groupValue: selectedHamil,
////          title: Text(optional.text),
////          onChanged: (currentHamil) {
////            setSelectedHamil(currentHamil);
////          },
////          selected: selectedHamil == optional,
////          activeColor: Colors.green,
////        ),
//      );
//    }
//    return widgets;
//  }

  List<Widget> createCheckHamil() {
    List<Widget> widgets = [];
    widgets.add(
        Row(
          children: <Widget>[
            Checkbox(
              value: isHamil,
              onChanged: (value) {
                // setHamil(value);
              },
            ),
            Text("Sedang Hamil",style: TextStyle(fontSize: 16))
          ],
        )
    );
    return widgets;
  }

//  List<Widget> createRadioListMenyusui() {
//    List<Widget> widgets = [];
//    for (Optional optional in menyusui) {
//      widgets.add(
//        RadioListTile(
//          value: optional,
//          groupValue: selectedMenyusui,
//          title: Text(optional.text),
//          onChanged: (currentMenyusui) {
//            setSelectedMenyusui(currentMenyusui);
//          },
//          selected: selectedMenyusui == optional,
//          activeColor: Colors.green,
//        ),
//      );
//    }
//    return widgets;
//  }

  List<Widget> createCheckMenyusui() {
    List<Widget> widgets = [];
    widgets.add(
        Row(
          children: <Widget>[
            Checkbox(
              value: isMenyusui,
              onChanged: (value) {
                // setMenyusui(value);
              },
            ),
            Text("Sedang Menyusui",style: TextStyle(fontSize: 16))
          ],
        )
    );
    return widgets;
  }

//  List<Widget> createRadioListKulitMerah() {
//    List<Widget> widgets = [];
//    for (Optional optional in kulitMerah) {
//      widgets.add(
//        RadioListTile(
//          value: optional,
//          groupValue: selectedKulitMerah,
//          title: Text(optional.text),
//          onChanged: (currentKulitMerah) {
//            setSelectedKulitMerah(currentKulitMerah);
//          },
//          selected: selectedKulitMerah == optional,
//          activeColor: Colors.green,
//        ),
//      );
//    }
//    return widgets;
//  }

  List<Widget> createCheckKulitMerah() {
    List<Widget> widgets = [];
    widgets.add(
        Row(
          children: <Widget>[
            Checkbox(
              value: isKulitMerah,
              onChanged: (value) {
                // setKulitMerah(value);
              },
            ),
            Text("Kulit Mudah Merah",style: TextStyle(fontSize: 16))
          ],
        )
    );
    return widgets;
  }

//  List<Widget> createRadioListAlergiObat() {
//    List<Widget> widgets = [];
//    for (Optional optional in alergiObat) {
//      widgets.add(
//        RadioListTile(
//          value: optional,
//          groupValue: selectedAlergiObat,
//          title: Text(optional.text),
//          onChanged: (currentAlergiObat) {
//            setSelectedAlergiObat(currentAlergiObat);
//          },
//          selected: selectedAlergiObat == optional,
//          activeColor: Colors.green,
//        ),
//      );
//    }
//    return widgets;
//  }

  List<Widget> createCheckAlergiObat() {
    List<Widget> widgets = [];
    widgets.add(
        Row(
          children: <Widget>[
            Checkbox(
              value: isAlergiObat,
              onChanged: (value) {
                // setAlergiObat(value);
              },
            ),
            Text("Alergi Obat",style: TextStyle(fontSize: 16))
          ],
        )
    );
    return widgets;
  }

  Future<void> _openGalleryFotoDepan(BuildContext context) async {
    imageFileFotoDepan = await _futureImageFotoDepan.pickImage(source: ImageSource.gallery);
    setState(() { });
    Navigator.pop(context);
  }
  Future<void> _openCameraFotoDepan(BuildContext context) async {
    imageFileFotoDepan = await _futureImageFotoDepan.pickImage(source: ImageSource.camera);
    setState(() { });
    Navigator.pop(context);

  }
  Future<void> _showChoiceDialogFotoDepan(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pilihlah"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGalleryFotoDepan(context);

                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCameraFotoDepan(context);

                },
              ),
            ],
          ),
        ),
      );
    });
  }

//Foto KIRI
  Future<void> _openGalleryFotoKiri(BuildContext context) async {
    imageFileFotoKiri = await _futureImageFotoKiri.pickImage(source: ImageSource.gallery);
    setState(() { });
    Navigator.pop(context);
  }
  Future<void> _openCameraFotoKiri(BuildContext context) async {
    imageFileFotoKiri = await _futureImageFotoKiri.pickImage(source: ImageSource.camera);
    setState(() { });
    Navigator.pop(context);

  }
  Future<void> _showChoiceDialogFotoKiri(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pilihlah"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGalleryFotoKiri(context);

                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCameraFotoKiri(context);

                },
              ),
            ],
          ),
        ),
      );
    });
  }

// FOTO Kanan

  Future<void> _openGalleryFotoKanan(BuildContext context) async {
    imageFileFotoKanan = await _futureImageFotoKanan.pickImage(source: ImageSource.gallery);
    setState(() { });
    Navigator.pop(context);
  }
  Future<void> _openCameraFotoKanan(BuildContext context) async {
    imageFileFotoKanan = await _futureImageFotoKanan.pickImage(source: ImageSource.camera);
    setState(() { });
    Navigator.pop(context);

  }
  Future<void> _showChoiceDialogFotoKanan(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pilihlah"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGalleryFotoKanan(context);

                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCameraFotoKanan(context);

                },
              ),
            ],
          ),
        ),
      );
    });
  }

//Foto Bermasalah

  Future<void> _openGalleryFotoBermasalah(BuildContext context) async {
    imageFileFotoBermasalah = await _futureImageFotoBermasalah.pickImage(source: ImageSource.gallery);
    setState(() { });
    Navigator.pop(context);
  }
  Future<void> _openCameraFotoBermasalah(BuildContext context) async {
    imageFileFotoBermasalah = await _futureImageFotoBermasalah.pickImage(source: ImageSource.camera);
    setState(() { });
    Navigator.pop(context);

  }
  Future<void> _showChoiceDialogFotoBermasalah(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pilihlah"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGalleryFotoBermasalah(context);

                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCameraFotoBermasalah(context);

                },
              ),
            ],
          ),
        ),
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar.getAppBar("Pertanyaan",Colors.pink[200],context),
      body:
      new SingleChildScrollView(
        child:  new SafeArea(
            child: new Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text("Apakah Jenis Kulit Anda?",style: TextStyle(fontSize: 16),),
                  ),
                  Column(
                    children: createRadioListJenisKulit(),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Divider(
                    height: 2,
                  ),
//                  Container(
//                    child: Text("Apakah Anda Sedang Hamil?",style: TextStyle(fontSize: 16),),
//                  ),
                  Column(
                    children: createCheckHamil(),
                  ),
                  isHamil == true ?
                  Divider(
                    height: 2,
                  )
                      : Container(),
                  isHamil == true ?
                  Container(
                      child:   TextField(
                        controller: _hamilController,
                        decoration: InputDecoration(
                          labelText: 'Jika Ya, Usia Kehamilan…. Bulan',
                        ),
                      )
                  )
                      : Container(),
                  Divider(
                    height: 2,
                  ),
//                  Container(
//                    child: Text("Apakah Anda Sedang Menyusui?",style: TextStyle(fontSize: 16),),
//                  ),
                  Column(
                    children: createCheckMenyusui(),
                  ),
                  Divider(
                    height: 2,
                  ),
//                  Container(
//                    child: Text("Apakah Kulit Anda Mudah Merah?",style: TextStyle(fontSize: 16),),
//                  ),
                  Column(
                    children: createCheckKulitMerah(),
                  ),
                  Divider(
                    height: 2,
                  ),
//                  Container(
//                    child: Text("Apakah Anda Alergi Obat?",style: TextStyle(fontSize: 16),),
//                  ),
                  Column(
                    children: createCheckAlergiObat(),
                  ),
                  Divider(
                    height: 2,
                  ),
                  Container(
                    child: TextField(
                      controller: _keluhanController,
                      decoration: InputDecoration(
                        labelText: 'Apakah Keluhan Anda?',
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  Container(
                    child: TextField(
                      controller: _pemakaianProdukController,
                      decoration: InputDecoration(
                        labelText: 'Pemakaian Produk Sebelumnya',
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Text("Foto Depan :",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                          )
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Text("Foto di area yang bermasalah (Optional):",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                          )
                      ),
                    ],
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child:
                              InkWell(
                                child:
                                imageFileFotoDepan == null ? Image.asset(
                                  "img/upload.png",
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ):
                                Image.file(
                                  File(imageFileFotoDepan!.path),
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ),
                                onTap: (){
                                  _showChoiceDialogFotoDepan(context);
                                },
                              )

                          )
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child:
                              InkWell(
                                child:
                                imageFileFotoBermasalah == null ? Image.asset(
                                  "img/upload.png",
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ):
                                Image.file(
                                  File(imageFileFotoBermasalah!.path),
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ),
                                onTap: (){
                                  _showChoiceDialogFotoBermasalah(context);
                                },
                              )

                          )
                      ),
                    ],
                  ),
                  //Foto KANAN

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Text("Foto Kiri :",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                          )
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child: Text("Foto Kanan :",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                          )
                      ),
                    ],
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child:
                              InkWell(
                                child:
                                imageFileFotoKiri == null ? Image.asset(
                                  "img/upload.png",
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ):
                                Image.file(
                                  File(imageFileFotoKiri!.path),
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ),
                                onTap: (){
                                  _showChoiceDialogFotoKiri(context);
                                },
                              )

                          )
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              child:
                              InkWell(
                                child:
                                imageFileFotoKanan == null ? Image.asset(
                                  "img/upload.png",
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ):
                                Image.file(
                                  File(imageFileFotoKanan!.path),
                                  fit: BoxFit.fitHeight,
                                  height: MediaQuery.of(context).size.height / 8,
                                ),
                                onTap: (){
                                  _showChoiceDialogFotoKanan(context);
                                },
                              )

                          )
                      ),
                    ],
                  ),

                  Divider(
                    height: 5,
                  ),

                  DialogButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:klinikku/history/dikirim.dart';
import 'package:klinikku/history/Selesai.dart';
import 'package:klinikku/history/belum_bayar.dart';
import 'package:klinikku/history/dibatalkan.dart';
import 'package:klinikku/history/dikemas.dart';

class  HistoriIndex extends StatefulWidget {
  @override
  _HistoriIndexState createState() => _HistoriIndexState();
}

class _HistoriIndexState extends State<HistoriIndex> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  late TabController controller;

  @override

  void initState(){
    controller = new TabController(vsync: this, length: 5);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        //warna background
        backgroundColor: Colors.pink[200],
        //judul
        title: new Text("Pesanan Saya"),
        leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: (){
          Navigator.pop(context);
        }),
        //bottom
        bottom: new TabBar(
          controller: controller,
          isScrollable: true,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(icon: null,text: "Belum Bayar",),
            new Tab(icon: null,text: "Dikemas",),
            new Tab(icon: null,text: "Dikirim",),
            new Tab(icon: null,text: "Selesai",),
            new Tab(icon: null,text: "Dibatalkan",),
          ],
        ),
      ),
      //source code lanjutan
      //buat body untuk tab viewnya
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new BelumBayar(),
          new Dikemas(),
          new Dikirim(),
          new Selesai(),
          new Dibatalkan(),
        ],
      ),
    );
  }
}
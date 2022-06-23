import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klinikku/auth/login.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/history/index.dart';
import 'package:klinikku/info/about_us.dart';
import 'package:klinikku/info/syarat_ketentuan.dart';
import 'package:klinikku/register/daftar.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  bool isLogin = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return
      showDialog(context: context,builder: (BuildContext context){
        return AlertDialog(
          title: Text("Tanya menggunakan?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Whatsapp"),
                  onTap: (){
                    // _launchInBrowser(String url);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0),),
                GestureDetector(
                  child: Text("Aplikasi ini"),
                  onTap: (){
                    // getDataPegawai(context);
                  },
                )
              ],
            ),
          ),
        );
      });
  }


  @override
  Widget build(BuildContext context) {
    if(Config.isLogin){
      return Scaffold(
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://picsum.photos/id/9/250/250"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      new Text(
                        "Muhammad Nur Syaifullah",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10.0),
                      ),
                      new Text(
                        'No. RM M0001',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.pink[200],
              ),
            ),
            ListTile(
              title: Text(
                'Akun',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onTap: () {
                Config.isAkun = true;
                setState(() {});
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pendaftaran()));
              },
            ),
            ListTile(
              title: Text(
                'Member Card',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.card_membership,
                color: Colors.black,
              ),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCard()));
              },
            ),
            ListTile(
              title: Text(
                'Histori Pesanan',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoriIndex()));
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.local_library,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsIndex()));
              },
            ),
            ListTile(
              title: Text(
                'Syarat & Ketentuan',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.warning,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SyaratKetentuanIndex()));
              },
            ),
            ListTile(
              title: Text(
                'Bantuan',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.live_help,
                color: Colors.black,
              ),
              onTap: () {
                _showChoiceDialog(context);
              },
            ),
            ListTile(
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              onTap: () {
                Config.isLogin = false;
                setState(() {});
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: ListTile(
            title: Text(
              "02.00",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            onTap: () {
            },
          ),
        ),
      );
    }else{
      return Scaffold(
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://picsum.photos/id/9/250/250"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      new Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.pink[200],
              ),
            ),
            ListTile(
              title: Text(
                'Login / Daftar',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            ListTile(
              title: Text(
                'Artikel',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.featured_play_list,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/Articles");
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.local_library,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsIndex()));
              },
            ),
            ListTile(
              title: Text(
                'Syarat & Ketentuan',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.warning,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SyaratKetentuanIndex()));
              },
            ),
            ListTile(
              title: Text(
                'Bantuan',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.live_help,
                color: Colors.black,
              ),
              onTap: () {
                _showChoiceDialog(context);
              },
            ),

          ],
        ),
        bottomNavigationBar: Container(
          child: ListTile(
            title: Text(
              "02.00",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            onTap: () {
            },
          ),
        ),
      );
    }
  }
}
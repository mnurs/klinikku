import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:klinikku/auth/login_hp.dart';
import 'package:klinikku/auth/login_rm.dart';
import 'package:klinikku/bantuan/bantuan.dart';
import 'package:klinikku/home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedTabIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.person), label:'No. RM'),
      BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
      BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'No. HP'),
    ];
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
                    _launchInBrowser(url());
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0),),
                GestureDetector(
                  child: Text("Aplikasi ini"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bantuan()));
                  },
                )
              ],
            ),
          ),
        );
      });
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
    if(index == 1){
      _showChoiceDialog(context);
    }
  }

  PageController pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        LoginRM(),
        LoginRM(),
        LoginHP(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

  }
  String url() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/6285219679808/?text=${Uri.parse("Hallo")}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=6285219679808=${Uri.parse("Hallo")}"; // new line
    }
  }

  Future<void> _launchInBrowser(String url) async {
    try {
      await launch(
        url,
        enableJavaScript: true,
      );
      // return true;
    } catch (e) {
      // log(e.toString());
      // return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavBar = BottomNavigationBar(
      items: buildBottomNavBarItems(),
      currentIndex: _selectedTabIndex,
      onTap: _onNavBarTapped,
      fixedColor: Colors.green[600],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );

    return Scaffold(
      body: buildPageView(),
      floatingActionButton: _selectedTabIndex != 1 ? Container(
        padding: EdgeInsets.only(bottom: 55.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            heroTag: "StayHomeStaySafe",
            onPressed: (){
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new HomePage());
              Navigator.of(context).push(route);
            },
            backgroundColor: Colors.green[600],
            child: Icon(Icons.home),
          ),
        ),
      )
          :
      Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        child: _bottomNavBar,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:klinikku/config/config.dart';
import 'package:klinikku/home/home.dart';
import 'package:klinikku/register/daftar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginHP extends StatefulWidget {
  @override
  _LoginHPState createState() => _LoginHPState();
}

class _LoginHPState extends State<LoginHP> {
  DateTime _currentDate = new DateTime.now();
  final phoneNumberValue = TextEditingController();

  signIn(String hp, String tanggal_lahir){
    Config.isLogin = true;
    setState(() {});
     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }



  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? _selDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (_selDate != null && _selDate != _currentDate)
      setState(() {
        _currentDate = _selDate;
      });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget tampilanLogoLogin(){
    return Container(
      padding: EdgeInsets.only(bottom: 70.0, top: 30.0),
      child:  Text(
        "KLINIKKU SKINCARE",
        style: TextStyle(fontSize: 25.0, color: Colors.green[700], fontFamily: 'Century Gothic'),
      ),
    );
  }

  Widget tampilanTulisanLogin(){
    return Text(
      "Login dengan No. HP",
      style: TextStyle(fontSize: 20.0, color: Colors.green[600], fontFamily: 'Century Gothic'),
    );
  }

  Widget tampilanFormLogin(){
    final Size screenSize = MediaQuery.of(context).size;
    String _formattedDate = _currentDate ==  null? new DateFormat('y-MM-dd').format(DateTime.now()):  new DateFormat('y-MM-dd').format(_currentDate);
    String _showFormattedDate =  _currentDate ==  null? "Tanggal Lahir": new DateFormat('dd MMMM yyyy').format(_currentDate);
    return  new Container(
      height: 250.0,
      color: Colors.transparent,
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0),
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: new Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: ListView(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneNumberValue,
                decoration: new InputDecoration(
                    hintText: '081234567890', labelText: 'No. HP'),
              ),
              paddingButtom(20.0),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$_showFormattedDate"),
                    FloatingActionButton(
                      elevation: 5,
                      child: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                onTap: (){
                  _selectDate(context);
                },
              ),
              paddingButtom(20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      width: screenSize.width,
                      child: new RaisedButton(
                        child: new Text(
                          'Login',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pushReplacementNamed("/Home");
                          // if(phoneNumberValue.text.isEmpty){
                          //   Alert(context: context, title: StoragePrefix.TYPEMESSAGEWARNING,type:AlertType.warning, desc: StoragePrefix.MESSAGEHPEMPTY ).show();
                          // }else{
                            signIn(phoneNumberValue.text.trim(), "$_formattedDate");
                          // }
                        },
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      width: screenSize.width,
                      child: new RaisedButton(
                        child: new Text(
                          'Daftar',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Config.isAkun = false;
                          setState(() {});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pendaftaran()));
                        },
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget paddingTop(double size){
    return Padding(
      padding: EdgeInsets.only(top: size),
    );
  }

  Widget paddingButtom(double size){
    return Padding(
      padding: EdgeInsets.only(bottom: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                paddingTop(50),
                tampilanLogoLogin(),
                paddingTop(50),
                tampilanTulisanLogin(),
                paddingTop(30),
                tampilanFormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

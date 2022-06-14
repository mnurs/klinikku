import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikku/register/daftar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginRM extends StatefulWidget {
  @override
  _LoginRMState createState() => _LoginRMState();
}

class _LoginRMState extends State<LoginRM> {
  DateTime _currentDate = new DateTime.now();
  final nrmValue = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  signIn(String nrm, String tanggal_lahir){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
      "Login dengan No. RM",
      style: TextStyle(fontSize: 20.0, color: Colors.green[600], fontFamily: 'Century Gothic'),
    );
  }

  Widget tampilanFormLogin(){
    final Size screenSize = MediaQuery.of(context).size;
    String _formattedDate =   _currentDate ==  null? new DateFormat('y-MM-dd').format(DateTime.now()):  new DateFormat('y-MM-dd').format(_currentDate);
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
                controller: nrmValue,
                decoration: new InputDecoration(
                    hintText: 'A1234', labelText: 'No. RM'),
              ),
              paddingButtom(10.0),
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

              paddingButtom(10.0),
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
                          if(nrmValue.text.isEmpty){
                            Alert(context: context, title: "Warning",type:AlertType.warning, desc: "NRM Tidak boleh kosong" ).show();
                          }else{
                            signIn(nrmValue.text.trim(), "$_formattedDate");
                          }
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pendaftaran()));
                          // Navigator.of(context).pushReplacementNamed("/Home");

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
                paddingTop(40),
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

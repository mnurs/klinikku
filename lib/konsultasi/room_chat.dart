import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:klinikku/pembayaran/keranjang.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//const String defaultUserName = "Deno Fambar";
var defaultNrm = "";
var defaultUserName = "";
var defaultDokterName = "";
var defaultPasienName = "";
var defaultUserId = "";

class Chat extends StatefulWidget {
  State createState() => new ChatWindow();
}

class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  List<Msg> _message = <Msg>[];
  TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;
  bool isShowSticker = false;
  ImagePicker _picker = ImagePicker();
  XFile? image;
  String prefSender = "";
  String prefChat = "";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
          if (payload != null) {
            debugPrint('notification payload: $payload');
          }
        });
  }

  Future _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'Channel id', 'Your notification ID',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Alert 🔔',
      'Message - There is a new notification on your account, kindly check it out',
      platformChannelSpecifics,
      payload:
      'Message - There is a new notification on your account, kindly check it out',
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  Future<void> kosong() async {
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
    return
     showDialog(context: context,builder: (BuildContext context){
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
             )
           ],
         ),
       ),
     );
   });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:
        Text('Pesan'),
        backgroundColor: Colors.pink[200],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(10.0),

            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  },

                  child: new Stack(

                    children: <Widget>[
                      new IconButton(icon: new Icon(Icons.shopping_cart,
                        color: Colors.white,),
                        onPressed: null,
                      ),
                      new Positioned(

                          child: new Stack(
                            children: <Widget>[
                              new Icon(
                                  Icons.brightness_1,
                                  size: 20.0, color: Colors.white),
                              new Positioned(
                                  top: 3.0,
                                  right: 4.0,
                                  child: new Center(
                                    child: new Text(
                                      "0",
                                      style: new TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )),


                            ],
                          )),

                    ],
                  ),
                )
            ),
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child:
            new RefreshIndicator(
              child:
              new ListView.builder(
                itemBuilder: (_, int index) => _message[index],
                itemCount: _message.length,
                reverse: true,
                padding: new EdgeInsets.all(6.0),
              ),
              onRefresh: kosong,
            ),
          ),
          new Divider(height: 1.0),
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // your list goes here

                  // Input content
                  _buildComposer(),
//                    buildInput(),

                  // Sticker
                  // (isShowSticker ? buildSticker() : Container()),
                ],
              ),
            ],
          ),
//          new Container(
//            child: _buildComposer(),
//            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//          )
        ],
      ),
    );
  }

  Widget emojiKeyboard(){
    if(isShowSticker){
      return IconButton(
        icon: Icon(Icons.keyboard,
            size: 30.0, color: Theme.of(context).hintColor),
        onPressed: () {
          setState(() {
            isShowSticker = !isShowSticker;
          });
        },
      );
    }else{
      return IconButton(
        icon: Icon(Icons.insert_emoticon,
            size: 30.0, color: Theme.of(context).hintColor),
        onPressed: () {
          FocusScope.of(context).unfocus();
          setState(() {
            isShowSticker = !isShowSticker;
          });
        },
      );
    }
  }

  Widget _buildComposer() {

    final roundedContainer = ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            emojiKeyboard(),
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxHeight: 150),
                child: SingleChildScrollView(
                  child: new TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,// when user pr
                    controller: _textController,
                    onChanged: (String txt) {
                      if(txt.trim().length > 0 && txt.trim().isNotEmpty && txt.trim() != ""){
                        setState(() {
                          _isWriting = true;
                        });
                      }else{
                        setState(() {
                          _isWriting = false;
                        });
                      }
                    },
                    onTap: (){
                      setState(() {
                        isShowSticker = false;
                      });
                    },
                    // onSubmitted: (){},
                    // _submitMsg,
                    decoration:
                    new InputDecoration.collapsed(hintText: "Ketik di sini"),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.camera_alt,
                  size: 30.0, color: Theme.of(context).hintColor),
              onPressed: () {
                _showChoiceDialog(context);
              },
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: roundedContainer,
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 3.0),
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? new CupertinoButton(
              child: new Text('Submit'),
              onPressed: _isWriting
                  ? () => {
                _showNotification()
              }
                  // _submitMsg(_textController.text)
                  : null,
            )
                : new IconButton(
              icon: new Icon(Icons.send),
              onPressed: _isWriting
                  ? () =>{
                _showNotification()
              }
                  // _submitMsg(_textController.text)
                  : null,
            ),
          )
//          GestureDetector(
//            onTap: () {},
//            child: CircleAvatar(
//              child: Icon(Icons.send),
//            ),
//          ),
        ],
      ),
    );
  }

  // addMessage(String type,String id_sender,String sender,String message,int timestamp,String dataPesan){
  //   Msg msg = new Msg(
  //     type:type,
  //     id_sender:id_sender,
  //     sender:sender,
  //     txt: message,
  //     timestamp: timestamp,
  //     animationController: new AnimationController(
  //         vsync: this, duration: new Duration(milliseconds: 800)),
  //   );
  //   setState(() {
  //     _message.insert(0,msg);
  //   });
  //   msg.animationController.forward();
  // }

  @override
  void dispose() {
    // for (Msg msg in _message) {
    //   msg.animationController.dispose();
    // }
    super.dispose();
  }

}



class Msg extends StatelessWidget {
  Msg({required this.txt,required  this.id_sender,required  this.sender,required  this.timestamp,required  this.animationController,required this.context});
  final String id_sender;
  final String sender;
  final String txt;
  final int timestamp;
  final AnimationController animationController;
  BuildContext context;

  Widget senderMessage(BuildContext context){
      return  new Container(
        margin: const EdgeInsets.only(top: 6.0),
        child: new Text(txt,textAlign: TextAlign.left),
      );
    }
  Widget myMessage(BuildContext context){
    return  new Container(
      margin: const EdgeInsets.only(top: 6.0),
      child: new Text(txt),
    );
  }

  String readTimestamp() {
    var now = new DateTime.now();
    var format = new DateFormat('d-M-yyy HH:mm');
    var formatTime = new DateFormat('HH:mm');
    double times = 0;
    ["", null, false, 0].contains(timestamp) ?  times = 0 :  times = timestamp / 10;
    var date = new DateTime.fromMicrosecondsSinceEpoch(times.toInt());
    var diff = date.difference(now);
    var time = '';
    if(diff.inDays == 0){
      time = "Hari ini "+ formatTime.format(date);
    }else if(diff.inDays == 1){
      time = "Kemarin "+ formatTime.format(date);
    }else{
      time = format.format(date);
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    var dateTime = readTimestamp();
    if(this.id_sender != defaultUserId){
      return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 18.0),
                child: new CircleAvatar(child: new Text(this.sender[0].toUpperCase())),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(dateTime,
                        style:  new TextStyle(
                          fontSize: 10.0,
                        )),
                    new Text(this.sender,
                        style: Theme.of(context).textTheme.headline1),
                    senderMessage(context)
//                    new Container(
//                      margin: const EdgeInsets.only(top: 6.0),
//                      child: new Text(txt),
//                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text(dateTime,
                        style:  new TextStyle(
                          fontSize: 10.0,
                        )),
                    new Text(this.sender,
                      style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.left,),
                    myMessage(context)
                  ],
                ),
              ),

              new Container(
                margin: const EdgeInsets.only(left:  18.0),
                child: new CircleAvatar(child: new Text(this.sender[0].toUpperCase())),
              ),
            ],
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';

class AboutUsIndex extends StatefulWidget {
  @override
  _AboutUsIndexState createState() => _AboutUsIndexState();
}

class _AboutUsIndexState extends State<AboutUsIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.pink[200],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Klinikku SkinCare adalah, sebuah klinik kecantikan yang didirikan oleh Dokter Spesialis dr. Damayanti, SpKK yang telah memiliki beberapa cabang, di beberapa kota.",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                Divider(height: 5, color: Colors.black,),
                SizedBox(height: 30,),
                Text("Visi", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Klinikku SkinCare adalah, sebuah klinik kecantikan yang didirikan oleh Dokter Spesialis dr. Damayanti, SpKK yang telah memiliki beberapa cabang, di beberapa kota.",
                  style: TextStyle(fontSize: 20),),
                SizedBox(height: 30,),
                Text("Misi", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Klinikku SkinCare adalah, sebuah klinik kecantikan yang didirikan oleh Dokter Spesialis dr. Damayanti, SpKK yang telah memiliki beberapa cabang, di beberapa kota.",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

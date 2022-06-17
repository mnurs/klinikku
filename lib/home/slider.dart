import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:klinikku/home/app_bar.dart';
import 'package:klinikku/home/drawer.dart';
import 'package:klinikku/produk/kategori.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  String userName = "No Data";
  List namaProduk = ["Pembersih Wajah","Krim Pagi & Krim Malam","Serum", "Perawatan Tubuh", "Produk Dekoratif","Masker","Perawatan Rambut"];
  List gambarProduk = ["img/meta/1.jpg","img/meta/2.jpg","img/meta/3.jpg","img/meta/4.jpg","img/meta/5.jpg","img/meta/6.jpg","img/meta/7.jpg"];
  List namaDokter = ["dr. Damayanti, SpKK","dr. Ratna Wulansari","dr. Juwita Resty Hapsari"];
  List promo = ["img/promo_spesial/1.jpg","img/promo_spesial/2.jpg","img/promo_spesial/3.jpg","img/promo_spesial/4.jpg","img/promo_spesial/5.jpg","img/promo_spesial/6.jpg","img/promo_spesial/7.jpg","img/promo_spesial/8.jpg","img/promo_spesial/9.jpg"];
  List jasa = ["img/jasa/1.png","img/jasa/2.png","img/jasa/3.png","img/jasa/4.png","img/jasa/5.png","img/jasa/6.png","img/jasa/7.png","img/jasa/8.png","img/jasa/9.png","img/jasa/10.png"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget labelPromo(){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Text(
            "Promo Spesial",
            style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontFamily: 'Century Gothic'),
          ),
          InkWell(
            onTap: () {
              // Navigator.pushReplacement(context, new MaterialPageRoute(
              //     builder: (BuildContext context) => new ListPromo()));
            },
            child: new Text(
              "Lihat semua",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                  fontFamily: 'Century Gothic'),
            ),
          )
        ],
      ),
    );
  }

  Widget tampilanPromo(){
    return  Container(
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // var route = new MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //     new PromoBannerDetail(
              //       value: "${promoData[index]["id_promosi"]}",
              //     ));
              // Navigator.of(context).push(route);
              //
              // setState(() {});
            },
            child: Image.asset(promo[index],
              fit: BoxFit.contain,)
          );
        },
        itemCount: promo.length,
        loop: false,
        autoplay: true,
        duration: 300,
        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
      height: 130,
    );
  }

  Widget labelProduk(){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Text(
            "Produk",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontFamily: 'Century Gothic'),
          ),
          InkWell(
            onTap: () {
              setState(() {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new KategoriProduk());
                Navigator.of(context).push(route);
              });
            },
            child: new Text(
              "Lihat semua",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                  fontFamily: 'Century Gothic'),
            ),
          )
        ],
      ),
    );
  }

  Widget tampilanProduk(){
    return  Container(
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    child: ClipRRect(
                      child:
                      Image.asset(gambarProduk[index],
                        fit: BoxFit.contain,)
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    namaProduk[index],
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontFamily: 'Century Gothic',
                        shadows: [
                          Shadow(
                            // bottomLeft
                              offset: Offset(-0.5, -0.5),
                              color: Colors.white),
                          Shadow(
                            // bottomRight
                              offset: Offset(0.5, -0.5),
                              color: Colors.white),
                          Shadow(
                            // topRight
                              offset: Offset(0.5, 0.5),
                              color: Colors.white),
                          Shadow(
                            // topLeft
                              offset: Offset(-0.5, 0.5),
                              color: Colors.white),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onTap: () {

            },
          );
        },
        itemCount: gambarProduk.length,
        viewportFraction: 0.5,
        scale: 0.8,
        loop: false,
      ),
      height: 200,
    );
  }

  Widget labelDokter(){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Text(
            "Dokter",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, new MaterialPageRoute(
              //     builder: (BuildContext context) => new ListDokter()));
            },
            child: new Text(
              "Lihat semua",
              style: TextStyle(
                  fontSize: 14.0, color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  Widget tampilanDokter(){
    return  Container(
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // var route = new MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //     new DoctorProfileDetail(
              //       value: "${doctorData[index]["id_pegawai"]}",
              //     ));
              // Navigator.of(context).push(route);
              //
              // setState(() {});
            },
            child: new Column(
              children: <Widget>[
                new Icon(
                  Icons.account_circle,
                  size: MediaQuery.of(context).size.height / 10,
                ),
                new Text(namaDokter[index], textAlign: TextAlign.center,)
              ],
            ),
          );
        },
        itemCount: namaDokter.length,
        viewportFraction: 0.4,
        scale: 0.5,
        loop: false,
      ),
      height: MediaQuery.of(context).size.height / 6,
    );
  }

  Widget labelTreatment(){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Text(
            "Treatment",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, new MaterialPageRoute(
              //     builder: (BuildContext context) => new ListTreatment()));
            },
            child: new Text(
              "Lihat semua",
              style: TextStyle(
                  fontSize: 14.0, color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  Widget tampilanTreatment(){
    return Container(
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                // var route = new MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //     new TreatmentDetail(
                //       value: "${jasaData[index]["id_jasa"]}",
                //     ));
                // Navigator.of(context).push(route);
//                          Navigator.of(context).pushNamed("/TreatmentDetail");
              });
            },
            child:
            // CachedNetworkImage(
            //   placeholder: (context, url) =>
            //       CircularProgressIndicator(),
            //   imageUrl: StoragePrefix.BaseUrl +
            //       '${jasaData[index]["lokasi_penyimpanan"]}',
            //   fit: BoxFit.cover,
            // ),
             new Image.asset(
               jasa[index],
               fit: BoxFit.contain,
             ),
          );
        },
        itemCount: jasa.length,
        viewportFraction: 0.8,
        scale: 0.8,
        loop: false,
      ),
      height: 150,
    );
  }

  Widget paddingTop(double luas){
    return  new Padding(
      padding: EdgeInsets.only(top: luas),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  ReusableAppbar.getAppBar("Klinikku SkinCare",Colors.pink[200],context),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/BG.png"), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                paddingTop(20.0),
                labelPromo(),
                paddingTop(10.0),
                tampilanPromo(),

                paddingTop(30.0),
                labelProduk(),
                paddingTop(10.0),
                tampilanProduk(),

                paddingTop(30.0),
                labelDokter(),
                paddingTop(15.0),
                tampilanDokter(),

                paddingTop(30.0),
                labelTreatment(),
                paddingTop(15.0),
                tampilanTreatment()
              ],
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:klinikku/home/slider.dart';
import 'package:klinikku/produk/kategori.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
      BottomNavigationBarItem(
          icon: Icon(Icons.money_off), label: 'Promo'),
      BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Produk'),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      onTap: _onNavBarTapped,
      fixedColor: Colors.pink[200],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );

    return Scaffold(
      body: [
        SliderPage(),
        // Pesan(),
        // Promo(),
        Category()
      ].elementAt(_selectedTabIndex),
      bottomNavigationBar: SafeArea(
        child: _bottomNavBar,
      ),
    );
  }
}

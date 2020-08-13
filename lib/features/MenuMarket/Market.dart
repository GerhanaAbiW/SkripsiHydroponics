import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:hydroponics/features/MenuMarket/Cart.dart';
import 'package:hydroponics/features/MenuMarket/HorizontalListView.dart';
import 'package:hydroponics/features/MenuMarket/Product.dart';
import 'package:hydroponics/features/MenuMarket/SearchMarket.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MenuMarket extends StatefulWidget {
  @override
  _MenuMarketState createState() => _MenuMarketState();
}

class _MenuMarketState extends State<MenuMarket> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/bayam.jpeg'),
          AssetImage('images/hydro1.jpeg'),
          AssetImage('images/obat.jpeg'),
          AssetImage('images/hydro2.jpeg'),
          AssetImage('images/pupuk.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          title: Text("HydroMarket"),
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new CartPage()));
                }),
          ],
        ),
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            Container(
              child: SearchWidget(),
              height: 70.0,
            ),
            image_carousel,
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.topCenter,
                  child: new Text("Categories")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HorizontalList(),
            ),
            Divider(),
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.topCenter,
                  child: new Text("Recent Product")),
            ),
            Flexible(child: Products()),
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Orders'),
                activeColor: Colors.blue),
          ],
        ));
  }
}

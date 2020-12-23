import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MainMenu/MainMenu.dart';

import 'package:hydroponics/features/MenuMarket/Cart/Cart.dart';
import 'package:hydroponics/features/MenuMarket/Market/HorizontalListView.dart';
import 'package:hydroponics/features/MenuMarket/Product/Product.dart';
import 'package:hydroponics/features/MenuMarket/ProductSearchScreen.dart';
import 'package:hydroponics/features/Widget/SearchProduct.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

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
    Provider.of<ProductProvider>(context, listen: false).loadProducts();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    Widget image_carousel = new Container(
      color: Colors.white,
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('images/hydro4.png'),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            changeScreen(context, DashBoard());
          },
        ),
        backgroundColor: Color(0xFF2b961f),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydro Market',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
        actions: <Widget>[
          Offstage(
            offstage: userProvider.userModel.role == "admin" ? true : false,
            child: new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new CartPage()));
                }),
          ),
        ],
      ),
      // appBar: new AppBar(
      //   elevation: 0.1,
      //   title: Text("HydroMarket"),
      //   backgroundColor: Colors.lightBlue,
      //   actions: <Widget>[
      //     new IconButton(
      //         icon: Icon(
      //           Icons.shopping_cart,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).push(new MaterialPageRoute(
      //               builder: (context) => new CartPage()));
      //         }),
      //   ],
      // ),
      //backgroundColor: Colors.white,
      body: Container(
        color: Colors.green[100],
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              // Container(
              //   child: SearchWidget(),
              //   height: 70.0,
              // ),
              SearchProduct(
                widget: SearchScreenMarket(),
                search: "What would you like to buy?",
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //           bottomRight: Radius.circular(20),
              //           bottomLeft: Radius.circular(20))),
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         top: 8, left: 8, right: 8, bottom: 10),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey.withOpacity(0.2),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: ListTile(
              //         leading: Icon(
              //           Icons.search,
              //           color: Colors.black,
              //         ),
              //         title: TextField(
              //           textInputAction: TextInputAction.search,
              //           onSubmitted: (pattern) async {
              //             await productProvider.search(productName: "s");
              //             changeScreen(context, SearchScreenMarket());
              //           },
              //           decoration: InputDecoration(
              //             hintText: "Search...",
              //             border: InputBorder.none,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              image_carousel,
              new Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: new Text("Categories",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HorizontalList(),
              ),

              new Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                    height: 20,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: new Text("Recent Product",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              Products(productProvider.products)
            ],
          ),
        ),
      ),
    );
  }
}

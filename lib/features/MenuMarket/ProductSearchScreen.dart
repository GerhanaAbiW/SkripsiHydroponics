import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/Cart.dart';
import 'package:hydroponics/features/MenuMarket/Product.dart';
import 'package:hydroponics/features/MenuMarket/ProductDetail.dart';
import 'package:provider/provider.dart';

class SearchScreenMarket extends StatefulWidget {
  @override
  _SearchScreenMarketState createState() => _SearchScreenMarketState();
}

class _SearchScreenMarketState extends State<SearchScreenMarket> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
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
      body: Container(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              // Container(
              //   child: SearchWidget(),
              //   height: 70.0,
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      title: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (pattern) async {
                          await productProvider.search(productName: pattern);
                          changeScreen(context, SearchScreenMarket());
                        },
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: productProvider.productsSearched.length < 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                color: grey,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: "No products Found",
                                color: grey,
                                weight: FontWeight.w300,
                                size: 22,
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: new Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              new Text("Product Found")
                            ],
                          ),
                          SizedBox(height: 16.0,),
                          Products(productProvider.productsSearched)
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

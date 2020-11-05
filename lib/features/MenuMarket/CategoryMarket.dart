import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/Cart.dart';
import 'package:hydroponics/features/MenuMarket/HorizontalListView.dart';
import 'package:hydroponics/features/MenuMarket/Product.dart';
import 'package:hydroponics/features/MenuMarket/ProductSearchScreen.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  // final CategoryModel categoryModel;

  final List<ProductModel> productsByCategory;

  CategoryScreen({this.productsByCategory});

  // const CategoryScreen({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final productProvider = Provider.of<ProductProvider>(context);
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
                          // print(pattern);
                          // String searchKey =
                          //     pattern[0].toUpperCase() + pattern.substring(1);
                          // await productProvider.search(productName: searchKey);
                          // changeScreen(context, ProductSearchScreen());
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

              new Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                    alignment: Alignment.topCenter,
                    child: new Text("Recent Product")),
              ),
              Container(
                child: productsByCategory.length == 0 ||
                        productsByCategory.length == null
                    ? CustomText(
                        text: "No products Found",
                        color: Colors.black,
                        weight: FontWeight.w300,
                        size: 22,
                      )
                    : Products(productsByCategory)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

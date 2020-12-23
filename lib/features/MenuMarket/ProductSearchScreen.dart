import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/Cart/Cart.dart';
import 'package:hydroponics/features/MenuMarket/Market/Market.dart';
import 'package:hydroponics/features/MenuMarket/Product/Product.dart';
import 'package:hydroponics/features/MenuMarket/Product/ProductDetail.dart';
import 'package:hydroponics/features/Widget/SearchProduct.dart';
import 'package:provider/provider.dart';

class SearchScreenMarket extends StatefulWidget {
  // final String hintText;
  //
  // const SearchScreenMarket({Key key, this.hintText}) : super(key: key);
  @override
  _SearchScreenMarketState createState() => _SearchScreenMarketState();
}

class _SearchScreenMarketState extends State<SearchScreenMarket> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            changeScreen(context, MenuMarket());
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
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              // Container(
              //   child: SearchWidget(),
              //   height: 70.0,
              // // ),
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
              //             await productProvider.search(productName: pattern);
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
                          SizedBox(
                            height: 16.0,
                          ),
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

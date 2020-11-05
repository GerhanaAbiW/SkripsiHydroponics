import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuLearning/Article/ArticleDetail.dart';
import 'package:hydroponics/features/MenuMarket/Market.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    final List imgList = widget.product.picture;
//  [
//    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//  ];

    List<NetworkImage> productAssets(List images) {
      List<NetworkImage> asset = List<NetworkImage>();

      for (String item in images) {
        asset.add(NetworkImage(item));
      }

      return asset;
    }

    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
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
//       appBar: new AppBar(
//         elevation: 0.1,
//         backgroundColor: Colors.green[700],
//         title: InkWell(
//           onTap: () {
//             changeScreenReplacement(context, MenuMarket());
//           },
//           child: Text("HydroMarket"),
//         ),
//         actions: <Widget>[
// //          new IconButton(
// //              icon: Icon(
// //                Icons.search,
// //                color: Colors.white,
// //              ),
// //              onPressed: () {}),
//           new IconButton(
//               icon: Icon(
//                 Icons.shopping_cart,
//                 color: Colors.white,
//               ),
//               onPressed: () {}),
//         ],
//       ),
      backgroundColor: Colors.green[100],
      body: ListView(children: <Widget>[
        new Container(
          height: 300.0,
          child: Column(children: <Widget>[
            Expanded(
              child: Carousel(
                boxFit: BoxFit.cover,
                images: productAssets(imgList),
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 4.0,
                dotColor: Colors.white,
                dotIncreasedColor: Colors.blue,
                indicatorBgPadding: 2.0,
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: ListTile(
                leading: new Text(
                  widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                title: new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("\$${widget.product.price}"),
                    ),
                    Expanded(
                      child: new Text(
                        "\$${widget.product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: MaterialButton(
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return AlertDialog(
        //                   title: new Text("Size"),
        //                   content: new Text("Choose the size"),
        //                   actions: <Widget>[
        //                     new MaterialButton(
        //                         onPressed: () {
        //                           Navigator.of(context).pop(context);
        //                         },
        //                         child: new Text("close"))
        //                   ],
        //                 );
        //               });
        //         },
        //         color: Colors.white,
        //         textColor: Colors.grey,
        //         elevation: 0.2,
        //         child: Row(children: <Widget>[
        //           Expanded(
        //             child: new Text("Size"),
        //           ),
        //           Expanded(child: new Icon(Icons.arrow_drop_down)),
        //         ]),
        //       ),
        //     ),
        //     Expanded(
        //       child: MaterialButton(
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return AlertDialog(
        //                   title: new Text("Quantity"),
        //                   content: new Text("Choose the quantity"),
        //                   actions: <Widget>[
        //                     new MaterialButton(
        //                         onPressed: () {
        //                           Navigator.of(context).pop(context);
        //                         },
        //                         child: new Text("close"))
        //                   ],
        //                 );
        //               });
        //         },
        //         color: Colors.white,
        //         textColor: Colors.grey,
        //         elevation: 0.2,
        //         child: Row(children: <Widget>[
        //           Expanded(
        //             child: new Text("Quantity"),
        //           ),
        //           Expanded(child: new Icon(Icons.arrow_drop_down)),
        //         ]),
        //       ),
        //     ),
        //   ],
        // ),
        Row(children: <Widget>[
          Expanded(
            child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the quantity"),
                        actions: <Widget>[
                          new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"))
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(children: <Widget>[
                Expanded(
                  child: new Text("Quantity"),
                ),
                new Icon(Icons.arrow_drop_down),
              ]),
            ),
          ),
          new IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.green,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {})
        ]),
        Divider(),
        new ListTile(
          title: new Text("Product Detail"),
          subtitle: new Text(widget.product.description),
        ),
        Divider(),
        new Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child:
                new Text("product name", style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: new Text(widget.product.name),
          )
        ]),
        new Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child:
                new Text("product brand", style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: new Text(widget.product.brand),
          )
        ]),
        new Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child: new Text("product condition",
                style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: new Text("New"),
          )
        ]),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: new MaterialButton(
              onPressed: () async {
                appProvider.changeIsLoading();
                bool success = await userProvider.addToCart(
                    product: widget.product, qty: qty);
                if (success) {
                  _key.currentState
                      .showSnackBar(SnackBar(content: Text("Added to Cart!")));
                  userProvider.reloadUserModel();
                  appProvider.changeIsLoading();
                  return;
                } else {
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text("Not added to Cart!")));
                  appProvider.changeIsLoading();
                  return;
                }
              },
              color: Colors.green[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.grey,
              child: new Text("Buy Now"),
            ),
          ),
        ),
        //Similar Product
//        Container(
//          height: 340.0,
//          child: SimilarProduct(),
//        )
      ]),
    );
  }
}

//class SimilarProduct extends StatefulWidget {
//  @override
//  _SimilarProductState createState() => _SimilarProductState();
//}
//
//class _SimilarProductState extends State<SimilarProduct> {
//  var productList = [
//    {"name": "Bayam", "picture": "images/bayam.jpeg", "price": "Rp.100"},
//    {"name": "Bayam", "picture": "images/bayam.jpeg", "price": "Rp.100"},
//    {"name": "Bayam", "picture": "images/bayam.jpeg", "price": "Rp.100"},
//    {"name": "Bayam", "picture": "images/bayam.jpeg", "price": "Rp.100"},
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      itemCount: productList.length,
//      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemBuilder: (BuildContext context, int index) {
//        return SimilarSinglePoduct(
//          productPicture: productList[index]["picture"],
//          productName: productList[index]["name"],
//          productPrice: productList[index]["price"],
//        );
//      },
//    );
//  }
//}
//
//class SimilarSinglePoduct extends StatelessWidget {
//  final productPicture;
//  final productName;
//  final productPrice;
//
//  SimilarSinglePoduct(
//      {this.productPicture, this.productName, this.productPrice});
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Hero(
//          tag: new Text("ProductDetail"),
//          child: Material(
//              child: InkWell(
//            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                builder: (context) => new ProductDetails(
//                      //parsing data
//                      productDetailName: productName,
//                      productDetailPicture: productPicture,
//                      productDetailPrice: productPrice,
//                    ))),
//            child: GridTile(
//              footer: Container(
//                color: Colors.white70,
//                child: ListTile(
//                  leading: Text(
//                    productName,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  title: Text(
//                    "\$$productPrice",
//                    style: TextStyle(
//                        color: Colors.green, fontWeight: FontWeight.w800),
//                  ),
//                  subtitle: Text(
//                    "\$$productPrice",
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontWeight: FontWeight.w800,
//                        decoration: TextDecoration.lineThrough),
//                  ),
//                ),
//              ),
//              child: Image.asset(
//                productPicture,
//                fit: BoxFit.cover,
//              ),
//            ),
//          ))),
//    );
//  }
//}

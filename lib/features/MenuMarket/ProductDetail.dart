import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/features/MenuMarket/Market.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.green[700],
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new MenuMarket()));
          },
          child: Text("HydroMarket"),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          // new IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Colors.white,
          // ), onPressed: (){}),
        ],
      ),
      backgroundColor: Colors.green[100],
      body: new ListView(children: <Widget>[
        new Container(
          height: 300.0,
          child: GridTile(
            child: Container(
                color: Colors.white70,
                child: CarouselSlider(
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
                ),),
            footer: new Container(
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
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose the size"),
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
                    child: new Text("Size"),
                  ),
                  Expanded(child: new Icon(Icons.arrow_drop_down)),
                ]),
              ),
            ),
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
                  Expanded(child: new Icon(Icons.arrow_drop_down)),
                ]),
              ),
            ),
          ],
        ),
        Row(children: <Widget>[
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              color: Colors.green[700],
              textColor: Colors.grey,
              elevation: 0.2,
              child: new Text("Buy Now"),
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
          subtitle: new Text(
             widget.product.description),
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
          child: new Text("Similar Products"),
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

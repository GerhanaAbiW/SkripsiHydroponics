import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/ProductDetail.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return GridView.builder(
      itemCount: productProvider.products.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ProductCard(
            product: productProvider.products[index],
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                changeScreen(context, ProductDetails(product: product,));
//                changeScreen(context, ProductDetails());
              },
              child: Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            color: Colors.grey.withOpacity(0.1))
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: 250.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white)),
                      Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Hero(
                            tag: product.picture,
                            child: Image.network(
                              "${product.picture[0]}",
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                        top: 7.0,
                        left: 7.0,
                        child: Text("\$${product.price}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      Positioned(
                          top: 7.0,
                          right: 10.0,
                          child: Icon(Icons.shopping_cart,
                              color: Colors.black, size: 15.0)),
                      Positioned(
                          top: 100.0,
                          left: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(product.name,
                                  style: TextStyle(
                                    fontFamily: 'AbrilFatFace',
                                    fontSize: 14.0,
                                  )),
                              SizedBox(height: 5.0),
                              Text("by: ${product.brand} ",
                                  style: TextStyle(
                                      fontSize: 11.0, color: Colors.black)),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  getRatingStar(product.rating, 1),
                                  getRatingStar(product.rating, 2),
                                  getRatingStar(product.rating, 3),
                                  getRatingStar(product.rating, 4),
                                  getRatingStar(product.rating, 5),
                                  SizedBox(width: 3.0),
                                  Text(product.rating.roundToDouble().toString(),
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xFF199693))),
                                ],
                              )
                            ],
                          ))
                    ],
                  )))),
    );
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
//                child: Column(
//                  children: <Widget>[
//                    ListTile(
//                      leading: Text(
//                        productName,
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                      title: Text(
//                        "\$$productPrice",
//                        style: TextStyle(
//                            color: Colors.green, fontWeight: FontWeight.w800),
//                      ),
//                      subtitle: Text(
//                        "\$$productPrice",
//                        style: TextStyle(
//                            color: Colors.black54,
//                            fontWeight: FontWeight.w800,
//                            decoration: TextDecoration.lineThrough),
//                      ),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        getRatingStar(productRating, 1),
//                        getRatingStar(productRating, 2),
//                        getRatingStar(productRating, 3),
//                        getRatingStar(productRating, 4),
//                        getRatingStar(productRating, 5),
//                        SizedBox(width: 3.0),
//                        Text(productRating.roundToDouble().toString(),
//                            style: TextStyle(
//                                fontSize: 14.0,
//                                color: Color(0xFF199693))),
//                      ],
//                    )
//                  ],
//                ),
//              ),
//              child: Image.asset(
//                productPicture,
//                fit: BoxFit.cover,
//              ),
//            ),
//          ))),
//    );
  }

  getRatingStar(rating, index) {
    if (index <= rating) {
      return Icon(
        Icons.star,
        color: Color(0xFF199693),
        size: 20.0,
      );
    } else {
      return Icon(
        Icons.star,
        color: Color(0xFFADDDDD),
        size: 20.0,
      );
    }
  }
}

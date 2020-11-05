import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/ProductDetail.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Products extends StatefulWidget {
  final List<ProductModel> products;
  Products(this.products);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.products.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: NewProductCard(
            product: widget.products[index],
          ),
        );
      },
    );
  }
}



class NewProductCard extends StatelessWidget {
  final ProductModel product;

  const NewProductCard({Key key, this.product}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen(
            context,
            ProductDetails(
              product: product,
            ));
      },
      child: Container(
        height: 200,
        // width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: product.picture[0],
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: product.name ?? "id null",
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                          onTap: () {
                          },
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: 18,
                          )),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                getRatingStar(product.rating, 1),
                getRatingStar(product.rating, 2),
                getRatingStar(product.rating, 3),
                getRatingStar(product.rating, 4),
                getRatingStar(product.rating, 5),
                SizedBox(width: 3.0),
                Text(product.rating.roundToDouble().toString(),
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF199693))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomText(
                text: "\$${product.price}",
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




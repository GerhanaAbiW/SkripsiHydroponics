import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/Product/ProductDetail.dart';
import 'package:hydroponics/features/Widget/Loading2.dart';
import 'package:intl/intl.dart';
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
  final currencyFormatter = NumberFormat('#,##0.00', 'ID');
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

class NewProductCard extends StatefulWidget {
  final ProductModel product;

  const NewProductCard({Key key, this.product}) : super(key: key);

  @override
  _NewProductCardState createState() => _NewProductCardState();
}

class _NewProductCardState extends State<NewProductCard> {
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

  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('#,##0.00', 'ID');
    final appProvider = Provider.of<AppProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        changeScreen(
            context,
            ProductDetails(
              product: widget.product,
            ));
      },
      child: Container(
        height: 200,
        // width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
                      child: Loading2(),
                    )),
                    Container(
                      //color: Colors.green[200],
                      width: MediaQuery.of(context).size.width,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.product.picture[0],
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.contain,
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
                    text: widget.product.name ?? "id null",
                  ),
                ),
                // Row(
                //   children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: favorite==true?GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           favorite = false;
                //         });
                //         // user.removeFromFavoriteProduct(product: widget.product)
                //       },
                //       child: Icon(
                //         Icons.favorite,
                //         color: Colors.red,
                //         size: 18,
                //       )):
                //   GestureDetector(
                //       onTap: () {
                //         user.addToFavoriteProduct(product: widget.product);
                //         setState(() {
                //           favorite = true;
                //         });
                //       },
                //       child: Icon(
                //         Icons.favorite,
                //         color: Colors.grey,
                //         size: 18,
                //       ))
                // ),
                Offstage(
                  offstage:
                      userProvider.userModel.role == "admin" ? true : false,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                        onTap: () async {
                          appProvider.changeIsLoading();
                          bool success = await userProvider.addToCart(
                              product: widget.product, qty: 1);
                          if (success) {
                            Fluttertoast.showToast(
                                msg: "Success Added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            userProvider.reloadUserModel();
                            appProvider.changeIsLoading();
                            return;
                          } else {
                            Fluttertoast.showToast(
                                msg: "Error Added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            appProvider.changeIsLoading();
                            return;
                          }
                        },
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                        )),
                  ),
                )
                //   ],
                // ),
              ],
            ),
            Row(
              children: <Widget>[
                getRatingStar(widget.product.rating, 1),
                getRatingStar(widget.product.rating, 2),
                getRatingStar(widget.product.rating, 3),
                getRatingStar(widget.product.rating, 4),
                getRatingStar(widget.product.rating, 5),
                SizedBox(width: 3.0),
                Text(widget.product.rating.roundToDouble().toString(),
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF199693))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                  "Rp. " +
                      currencyFormatter.format(widget.product.price).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

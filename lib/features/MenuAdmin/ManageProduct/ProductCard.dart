import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageProduct/ProductUpdate.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantsDetails.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({this.productModel});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    final appProvider = Provider.of<AppProvider>(context,listen: false);

    final currencyFormatter = NumberFormat('#,##0.00', 'ID');
    ProductServices productService = ProductServices();
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 90, //MediaQuery.of(context).size.height / 9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                changeScreen(
                    context,
                    UpdateProduct(
                      product: productModel,
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60, //ScreenUtil().setWidth(60),
                        height: 60, //ScreenUtil().setWidth(60),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(),
                        ),
                        child:
                            // plantPicture != null
                            //     ? ClipRRect(
                            //         borderRadius: BorderRadius.circular(
                            //             44), //ScreenUtil().setWidth(44)),
                            //         child: Image.network(
                            //           plantPicture,
                            //           fit: BoxFit.fitHeight,
                            //           height: 60, //ScreenUtil().setWidth(60),
                            //         ),
                            //       )
                            //     :

                            Stack(
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
                                image: productModel.picture[0],
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Hero(
                    //     tag: imgPath,
                    //     child: CircleAvatar(
                    //       radius: 30,
                    //       backgroundImage: ExactAssetImage(imgPath),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(productModel.category,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Rp. " +
                                    currencyFormatter
                                        .format(productModel.price)
                                        .toString(),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey))
                          ]),
                    )
                  ])),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      appProvider.changeIsLoading();
                      productService.deleteProduct(productModel.id);
                      appProvider.changeIsLoading();
                      productProvider.loadProducts();
                    },
                  )
                ],
              ))),
    );
  }
}

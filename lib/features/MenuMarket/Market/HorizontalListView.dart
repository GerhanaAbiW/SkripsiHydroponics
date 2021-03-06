import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMarket/MarketByCategory/CategoryMarket.dart';
import 'package:provider/provider.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      //color: Colors.white,
      child: ListView(scrollDirection: Axis.horizontal,
          shrinkWrap: true,children: <Widget>[
        Categories(
          imageLocation: "images/Icons/1.png",
          imageCaption: "Bibit",
        ),
        Categories(
          imageLocation: "images/Icons/2.png",
          imageCaption: "Obat",
        ),
        Categories(
          imageLocation: "images/Icons/3.png",
          imageCaption: "Pupuk",
        ),
        Categories(
          imageLocation: "images/Icons/4.png",
          imageCaption: "Alat",
        ),
      ]),
    );
  }
}

class Categories extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Categories({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
          onTap: () async{
            await productProvider.loadProductsByCategory(
                categoryName:
                imageCaption);

            changeScreen(
                context,
                CategoryScreen(
                productsByCategory: productProvider.productsByCategory,
                ));
          },
          child: Container(
              width: 80.0,
              height: 80.0,
              child: ListTile(
                  title: Image.asset(
                    imageLocation,
                    width: 40.0,
                    height: 50.0,
                  ),
                  subtitle: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      imageCaption,
                      style: new TextStyle(fontSize: 12.0),
                    ),
                  )))),
    );
  }
}



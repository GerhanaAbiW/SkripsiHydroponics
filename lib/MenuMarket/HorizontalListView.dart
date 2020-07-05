import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      //color: Colors.white,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Categories(
          imageLocation: "images/categories/Bibit.png",
          imageCaption: "Bibit",
        ),
        Categories(
          imageLocation: "images/categories/pestisida.jpg",
          imageCaption: "Pestisida",
        ),
        Categories(
          imageLocation: "images/categories/pupuk.png",
          imageCaption: "Pupuk",
        ),
        Categories(
          imageLocation: "images/categories/alat1.png",
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
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
          onTap: () {},
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

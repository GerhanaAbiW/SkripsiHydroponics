import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantUpdate.dart';

class PlantCard extends StatelessWidget {
  final Plants plant;

  const PlantCard({Key key, this.plant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PlantService _plantService = PlantService();
    return Container(
      height: 100, //MediaQuery.of(context).size.height,
      child: Card(
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                changeScreen(context, UpdatePlant(plant: plant,));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 70,
                              //ScreenUtil().setWidth(60),
                              height: 60,
                              //ScreenUtil().setWidth(60),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(),
                              ),
                              child: plant.image !=
                                  null
                                  ? Image.network(
                                '${plant.image}',
                                fit: BoxFit.fill,
                              )
                                  : Image.asset("images/bayam.jpeg")),
                        ),
                        SizedBox(width: 3.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                  width: MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.6,
                                  child: Text(
                                      plant.plant,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0),
                                  child: Text(
                                      plant.createdAt,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey)),
                                )
                              ]),
                        )
                      ])),
                  GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      _plantService.deletePlant(
                          plant.id);
                    },
                  )
                ],
              ))),
    );
  }
}

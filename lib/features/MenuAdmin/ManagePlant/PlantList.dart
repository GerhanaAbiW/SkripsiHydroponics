import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantCard.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';
import 'package:provider/provider.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  PlantService _plantService = PlantService();

  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        actions: <Widget>[
          Center(
            child: Text(
              'Add Article',
              style: TextStyle(color: green),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: green,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: plantProvider.plants.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100, //MediaQuery.of(context).size.height,
                  child: Card(
                      elevation: 10.0,
                      child: InkWell(
                          onTap: () {
                            changeScreen(context, PlantDetail());
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
                                          child: plantProvider
                                              .plants[index].image !=
                                              null
                                              ? Image.network(
                                            '${plantProvider.plants[index].image}',
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
                                                  plantProvider
                                                      .plants[index].plant,
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
                                                  plantProvider
                                                      .plants[index].date,
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
                                      plantProvider.plants[index].id);
                                },
                              )
                            ],
                          ))),
                );
              },
            ),
          )),
    );
  }
}

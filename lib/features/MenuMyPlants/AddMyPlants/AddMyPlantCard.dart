import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantsDetails.dart';
import 'package:hydroponics/features/Widget/Loading2.dart';
import 'package:transparent_image/transparent_image.dart';

class AddMyPlantCard extends StatelessWidget {
  final Plants plant;

  AddMyPlantCard({this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, //MediaQuery.of(context).size.height / 9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                changeScreen(
                    context,
                    MyPlantsDetail(
                      plant: plant,
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
                            // plantPicture != null ?
                            //     ClipRRect(
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
                              child: Loading2(),
                            )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: '${plant.image}',
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   image: plant.image,
                              //   height: MediaQuery.of(context).size.height,
                              //   fit: BoxFit.cover,
                              // ),
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
                            Text(plant.plant,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(plant.harvestTime,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey))
                          ]),
                    )
                  ])),
                ],
              ))),
    );
  }
}

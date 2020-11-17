import 'package:flutter/material.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddPlantsDetails.dart';

class WidgetLIstRecordDetailPlant extends StatelessWidget {
  final plantName;
  final desc;
  final plantPicture;

  WidgetLIstRecordDetailPlant({this.plantName, this.desc, this.plantPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      //height: 130, //MediaQuery.of(context).size.height / 9,
      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Container(

          //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          //elevation: 10.0,
          child: InkWell(
              onTap: () {
                changeScreen(context, MyPlantsDetail());
              },
              child: Column(
                children: <Widget>[
                  //untuk header
                  Container(
                    child: Column(
                      children: <Widget>[
                        Divider(color: Colors.black),
                        Text(
                          "20 januari 2020",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        Divider(color: Colors.black)
                      ],
                    ),
                  ),
                  Row(
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

                                Image.asset("images/plant.png"),
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
                                Text(plantName,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(desc,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.grey))
                              ]),
                        )
                      ])),
                    ],
                  ),
                ],
              ))),
    );
  }
}

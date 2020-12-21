import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/MyPlantsRecordDetail.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class WidgetLIstRecordDetailPlant extends StatefulWidget {
  final MyPlantsRecordModel model;
  final bool header;

  WidgetLIstRecordDetailPlant({this.model, this.header});

  @override
  _WidgetLIstRecordDetailPlantState createState() =>
      _WidgetLIstRecordDetailPlantState();
}

class _WidgetLIstRecordDetailPlantState
    extends State<WidgetLIstRecordDetailPlant> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
        child: InkWell(
            onTap: () {
              changeScreen(
                  context,
                  MyPlantsRecordDetail(
                    model: widget.model,
                  ));
            },
            child: Column(
              children: <Widget>[
                //untuk header
                Offstage(
                  offstage: widget.header,
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 1.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.model.date,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                              // decoration: TextDecoration.underline,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 1.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
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

                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              )),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: widget.model.image,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(widget.model.plant,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(widget.model.harvestTime,
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
                      onTap: () async{
                        if(await userProvider.deleteMyPlantRecord(
                            plantItem: widget.model)==true){
                          userProvider.reloadUserModel();
                        }

                      },
                    )
                  ],
                ),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:transparent_image/transparent_image.dart';

import 'MyPlantAddRecordDetail.dart';

class MyPlantDetail extends StatefulWidget {
  final MyPlantsModel plant;

  const MyPlantDetail({Key key, this.plant}) : super(key: key);
  @override
  _MyPlantDetailState createState() => _MyPlantDetailState();
}

class _MyPlantDetailState extends State<MyPlantDetail> {
  void visibleBtnRecord() {
    if (DateTime.now().isAfter(DateTime.parse(widget.plant.harvestDay)) ==
            true ||
        DateTime.now()
                .isAtSameMomentAs(DateTime.parse(widget.plant.harvestDay)) ==
            true) {
      setState(() {
        btnRecord = true;
      });
    } else {
      setState(() {
        btnRecord = false;
      });
    }
  }

  external bool isAfter(DateTime other);
  external bool isAtSameMomentAs(DateTime other);
  bool btnRecord = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //record = DateTime.parse(widget.myPlantsModel.harvestDay);
    visibleBtnRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 60.0,
                    ),
                    height: 600.0,
                    color: Color(0xFF8BC34A), //Color(0xFF32A060),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),

                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: widget.plant.image,
                                //height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60.0),
                        Text(
                          widget.plant.plant,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'PH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.ph,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'PPM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.plant.ppm,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //SizedBox(height: 40.0),
                        // RawMaterialButton(
                        //   padding: EdgeInsets.all(20.0),
                        //   shape: CircleBorder(),
                        //   elevation: 2.0,
                        //   fillColor: Colors.black,
                        //   child: Icon(
                        //     Icons.add_shopping_cart,
                        //     color: Colors.white,
                        //     size: 35.0,
                        //   ),
                        //   onPressed: () => print('Add to cart'),
                        // ),
                      ],
                    ),
                  ),

                  // Positioned(
                  //   right: 20.0,
                  //   bottom: 30.0,
                  //   child: Hero(
                  //     tag: widget.plant.image,
                  //     child: Image(
                  //       height: 280.0,
                  //       width: 280.0,
                  //       image: AssetImage(widget.plant.image),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Container(
                height: 320, //MediaQuery.of(context).size.height * 1,
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 40.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Karakteristik:',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Text("Media Semai: ${widget.plant.media}"),
                          Text("Waktu Semai: ${widget.plant.seedingTime}"),
                          Text("Jenis Pupuk: ${widget.plant.fertilizerType}"),
                          Text("Dosis Pupuk: ${widget.plant.dosageFertilizer}"),
                          Text(
                              "Waktu Pemupukan: ${widget.plant.timeOfFertilizer}"),
                          Text("Waktu Panen: ${widget.plant.harvestTime}"),
                        ],
                      ),
                    ),
                    SizedBox(height: 64),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        // vertical: 40.0,
                      ),
                      child: btnRecord == true
                          ? Center(
                              child: GestureDetector(
                                onTap: () {
                                  changeScreen(
                                      context,
                                      PlantStartRecord(
                                        myPlantsModel: widget.plant,
                                        status: "Harvest",
                                      ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: darkGreenColor),
                                  child: Text(
                                    'Harvest',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  changeScreen(
                                      context,
                                      PlantStartRecord(
                                        myPlantsModel: widget.plant,
                                        status: "Crop Failure",
                                      ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: darkGreenColor),
                                  child: Text(
                                    'Crop Failure',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

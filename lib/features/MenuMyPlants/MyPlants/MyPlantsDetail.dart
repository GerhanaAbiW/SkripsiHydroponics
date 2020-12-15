import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsList.dart';
import 'package:provider/provider.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);

class PlantStartRecord extends StatefulWidget {
  final MyPlantsModel myPlantsModel;

  const PlantStartRecord({Key key, this.myPlantsModel}) : super(key: key);

  @override
  _PlantStartRecordState createState() => _PlantStartRecordState();
}

class _PlantStartRecordState extends State<PlantStartRecord> {
  bool mediaSemai = false;
  bool waktuSemai = false;
  bool jenisPupuk = false;
  bool dosisPupuk = false;
  bool waktuPupuk = false;
  bool waktuPanen = false;
  bool phIdeal = false;
  bool ppmIdeal = false;

  final _key = GlobalKey<ScaffoldState>();
  DateTime record;
  external bool isAfter(DateTime other);
  external bool isAtSameMomentAs(DateTime other);
  bool btnRecord = true;

  void changeSelected(bool btn) {
    setState(() {
      btn = !btn;
    });
  }
  void visibleBtnRecord(){
    if(DateTime.now().isAfter(DateTime.parse(widget.myPlantsModel.harvestDay))==true || DateTime.now().isAtSameMomentAs(DateTime.parse(widget.myPlantsModel.harvestDay))==true){
      setState(() {
        btnRecord = false;
      });
    }else{
      setState(() {
        btnRecord = true;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    record = DateTime.parse(widget.myPlantsModel.harvestDay);
    visibleBtnRecord();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        key: _key,
        backgroundColor: greenColor,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(300.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 60, 10),
                              child: Text(widget.myPlantsModel.plant,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: darkGreenColor,
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Image.network(
                              widget.myPlantsModel.image,
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Karakteristik",
                            style: TextStyle(
                                color: darkGreenColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Text("*NOTE : isi mendekati waktu panen",
                            style: TextStyle(
                                color: darkGreenColor,
                                fontSize: 10.0,
                                fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Media Semai: ${widget.myPlantsModel.media}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: mediaSemai,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          mediaSemai = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Waktu Semai: ${widget.myPlantsModel.seedingTime}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: waktuSemai,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          waktuSemai = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Jenis Pupuk: ${widget.myPlantsModel.fertilizerType}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: jenisPupuk,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          jenisPupuk = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Dosis Pupuk: ${widget.myPlantsModel.dosageFertilizer}"),
                                  Checkbox(
                                    activeColor: Colors.greenAccent,
                                      value: dosisPupuk,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          dosisPupuk = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Waktu Pemupukan: ${widget.myPlantsModel.timeOfFertilizer}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: waktuPupuk,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          waktuPupuk = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "Waktu Panen: ${widget.myPlantsModel.harvestTime}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: waktuPanen,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          waktuPanen = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      "PPM Ideal: ${widget.myPlantsModel.ppm}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: ppmIdeal,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          ppmIdeal = value;
                                        });
                                      }),
                                ]),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("PH Ideal: ${widget.myPlantsModel.ph}"),
                                  Checkbox(
                                      activeColor: Colors.greenAccent,
                                      value: phIdeal,
                                      onChanged: (bool value) {
                                        print(value);
                                        setState(() {
                                          phIdeal = value;
                                        });
                                      }),
                                ]),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Offstage(
                          offstage: btnRecord,
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                appProvider.changeIsLoading();
                                bool success =
                                    await userProvider.addMyPlantRecord(
                                        myPlants: widget.myPlantsModel,
                                        waktuPanen: waktuPanen,
                                        waktuPupuk: waktuPupuk,
                                        waktuSemai: waktuSemai,
                                        mediaSemai: mediaSemai,
                                        phIdeal: phIdeal,
                                        dosisPupuk: dosisPupuk,
                                        ppmIdeal: ppmIdeal,
                                        jenisPupuk: jenisPupuk);
                                if (success) {
                                  _key.currentState.showSnackBar(
                                      SnackBar(content: Text("Added to My Record Plants!")));
                                  userProvider.reloadUserModel();
                                  appProvider.changeIsLoading();
                                  userProvider.deleteMyPlant(plantItem: widget.myPlantsModel);
                                  return changeScreen(context, MyPlantsList());
                                } else {
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Not added to My Record Plants!")));
                                  appProvider.changeIsLoading();
                                  return;
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: darkGreenColor),
                                child: Text(
                                  'Record',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),

                    //SizedBox(height: 16.0)
                  ],
                ),
              ),
            ),
          ],
        ));
  }

}

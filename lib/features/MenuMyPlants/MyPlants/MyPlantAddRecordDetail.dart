import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsList.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);

class PlantStartRecord extends StatefulWidget {
  final MyPlantsModel myPlantsModel;
  final String status;

  const PlantStartRecord({Key key, this.myPlantsModel, this.status}) : super(key: key);

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
  File _image;
  bool isLoading = false;

  Future getImage(ImageSource media) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: media);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
  final _key = GlobalKey<ScaffoldState>();
  //DateTime record;
  // external bool isAfter(DateTime other);
  // external bool isAtSameMomentAs(DateTime other);
  // bool btnRecord = true;

  void changeSelected(bool btn) {
    setState(() {
      btn = !btn;
    });
  }
  TextEditingController descController = TextEditingController();


  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


  // void visibleBtnRecord() {
  //   if (DateTime.now().isAfter(DateTime.parse(widget.myPlantsModel.harvestDay)) == true ||
  //       DateTime.now().isAtSameMomentAs(DateTime.parse(widget.myPlantsModel.harvestDay)) == true) {
  //     setState(() {
  //       btnRecord = false;
  //     });
  //   } else {
  //     setState(() {
  //       btnRecord = true;
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //record = DateTime.parse(widget.myPlantsModel.harvestDay);
    //visibleBtnRecord();
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
                              padding:
                              const EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: _image == null
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "images/no_image_icon.png",
                                  fit: BoxFit.contain,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                  MediaQuery.of(context).size.height / 3,
                                ),
                              )
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.contain,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                  MediaQuery.of(context).size.height / 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: widget.myPlantsModel.image,
                                //height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Isi sesuai dengan perlakuan yang anda berikan selama menanam",
                            style: TextStyle(
                                color: darkGreenColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Text("Karakteristik",
                            style: TextStyle(
                                color: darkGreenColor,
                                fontSize: 15.0,
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
                            MultilineFormTextField(
                                controller: descController,
                                textHint: "Masukkan Isi Konten",
                                textLabel: "Konten",
                                height: 10),
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
                       Center(
                            child: GestureDetector(
                              onTap: () async {
                                if (_image != null && descController.text != null) {
                                  setState(() => isLoading = true);
                                  String imageUrl1;
                                  final FirebaseStorage storage = FirebaseStorage.instance;
                                  final String picture1 =
                                      "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                                  StorageUploadTask task1 = storage.ref().child("RecordPlant").child(picture1).putFile(_image);
                                  StorageTaskSnapshot snapshot1 =
                                  await task1.onComplete.then((snapshot) => snapshot);

                                  task1.onComplete.then((snapshot3) async {
                                    imageUrl1 = await snapshot1.ref.getDownloadURL();
                                    appProvider.changeIsLoading();
                                    bool success =
                                    await userProvider.addMyPlantRecord(
                                        status: "Harvest",
                                        img: imageUrl1,
                                        description: descController.text,
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
                                      _key.currentState.showSnackBar(SnackBar(
                                          content:
                                          Text("Added to My Record Plants!")));
                                      userProvider.reloadUserModel();
                                      appProvider.changeIsLoading();
                                      userProvider.deleteMyPlant(
                                          plantItem: widget.myPlantsModel);
                                      return changeScreen(context, MyPlantsList());
                                    } else {
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text(
                                              "Not added to My Record Plants!")));
                                      appProvider.changeIsLoading();
                                      return;
                                    }

                                  });
                                } else {
                                  _key.currentState.showSnackBar(SnackBar(
                                      content:
                                      Text("Please add some description and image")));
                                  setState(() => isLoading = false);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: darkGreenColor),
                                child: Text(
                                  'Record',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
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

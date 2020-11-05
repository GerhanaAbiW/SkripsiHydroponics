import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';

class AddPlantView extends StatefulWidget {
  @override
  _AddPlantViewState createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  bool isTrue = false;
  Radius topLeft;
  File _image;
  bool isLoading = false;
  Future getImage(ImageSource media) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: media);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
  PlantService _plantService = PlantService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController namaTumbuhanController = TextEditingController();
  TextEditingController mediaSemaiController = TextEditingController();
  TextEditingController waktuSemaiController = TextEditingController();
  TextEditingController phIdealController = TextEditingController();
  TextEditingController ppmIdealController = TextEditingController();
  TextEditingController jenisPupukController = TextEditingController();
  TextEditingController dosisPupukController = TextEditingController();
  TextEditingController waktuPupukController = TextEditingController();
  TextEditingController waktuPanenController = TextEditingController();
  TextEditingController jenisHamaController = TextEditingController();
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

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image != null) {
        String imageUrl1;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 =
            "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image);
        StorageTaskSnapshot snapshot1 =
            await task1.onComplete.then((snapshot) => snapshot);

        task1.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          _plantService.uploadPlant({
            "Plant": namaTumbuhanController.text,
            "Media": mediaSemaiController.text,
            "Image": imageUrl1,
            "PPM": ppmIdealController.text,
            "PH": phIdealController.text,
            "FertilizerType": jenisPupukController.text,
            "TimeOfFertilizer": waktuPupukController.text,
            "DosageOfFertilizer": dosisPupukController.text,
            "HarvestTime": waktuPanenController.text,
            "PestType": jenisHamaController.text
          });
          _formKey.currentState.reset();
          setState(() => isLoading = false);
          Navigator.pop(context);
        });
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Provider.of<NewPatientRegistrationViewModel>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, right: 16),
                          child: _image == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "images/no-image-icon.png",
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // decoration: BoxDecoration(bord),
                            width: MediaQuery.of(context).size.width / 3,
                            height: 50.0,
                            child: FlatButton(
                              shape: CircleBorder(
                                  // borderRadius: BorderRadius.circular(2000.0),
                                  side: BorderSide(color: Colors.white)),
                              color: GreenTosca,
                              child: Icon(
                                Icons.camera_alt,
                                color: white,
                              ),
                              // child: Center(
                              //     child: Text(
                              //   'Choose Image',
                              //   textAlign: TextAlign.center,
                              // )),
                              onPressed: () {
                                myAlert();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Nama Tumbuhan',
                      textHint: "Masukkan nama tumbuhan",
                      controller: namaTumbuhanController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Media Semai',
                      textHint: "Masukkan media semai",
                      controller: mediaSemaiController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Waktu Semai',
                      textHint: "Masukkan waktu semai",
                      controller: waktuSemaiController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'PH Ideal',
                      textHint: "Masukkan PH ideal",
                      controller: phIdealController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'PPM Ideal',
                      textHint: "Masukkan PPM ideal",
                      controller: ppmIdealController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Jenis Pupuk',
                      textHint: "Masukkan jenis pupuk",
                      controller: jenisPupukController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Dosis Pupuk',
                      textHint: "Masukkan dosis pupuk",
                      controller: dosisPupukController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Waktu Pupuk',
                      textHint: "Masukkan waktu pupuk",
                      controller: waktuPupukController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Waktu Panen',
                      textHint: "masukkan waktu panen",
                      controller: waktuPanenController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  FormTextField(
                      textLabel: 'Jenis Hama',
                      textHint: "Masukkan jenis hama",
                      controller: jenisHamaController),
                  new SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        validateAndUpload();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: GreenTosca,
                          // gradient: LinearGradient(
                          //     colors: [
                          //       GreenTosca,
                          //       green,
                          //       CustomColors.COLOR_GREEN
                          //     ],
                          //     end: Alignment.centerLeft,
                          //     begin: Alignment.centerRight),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Add Plant",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

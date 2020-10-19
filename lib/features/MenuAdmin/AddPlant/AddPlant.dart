import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/Costumized_Text_Field.dart';
import 'package:hydroponics/features/MenuAdmin/AppTools.dart';
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
//    if (_formKey.currentState.validate()) {
//      setState(() => isLoading = true);
//      if (_image != null) {
//        String imageUrl1;
//        final FirebaseStorage storage = FirebaseStorage.instance;
//        final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
//        StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image);
//        StorageTaskSnapshot snapshot1 =
//        await task1.onComplete.then((snapshot) => snapshot);
//
//        task1.onComplete.then((snapshot3) async {
//          imageUrl1 = await snapshot1.ref.getDownloadURL();
////          articleService.uploadArticle({
////            "title": titleController.text,
////            "author": authorController.text,
////            "date": dateController.text,
////            "description" : descController.text,
////            "image": imageUrl1,
////          });
////          _formKey.currentState.reset();
//          setState(() => isLoading = false);
//          Navigator.pop(context);
//        });
//      } else {
//        setState(() => isLoading = false);
//
////        Fluttertoast.showToast(msg: 'all the images must be provided');
//      }
//    }
  }

  @override
  void initState() {
    super.initState();

    // Provider.of<NewPatientRegistrationViewModel>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                              padding:
                              const EdgeInsets.only(left: 16, top: 16, right: 16),
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
                      Row(
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
                                    side: BorderSide(color: Colors.black)),
                                color: GreenTosca,
                                child: Icon(Icons.camera_alt),
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
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                          textTitle: 'Lengkapi Kriteria Tumbuhan',
                          //textHint: "Enter Product Title",
                          //controller: productNameController
                        ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Nama Tumbuhan',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Media Semai',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Waktu Semai',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'PH Ideal',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'PPM Ideal',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Jenis Pupuk',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Dosis Pupuk',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Waktu Pupuk',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Waktu Panen',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      productTextField(
                        textTitle: 'Jenis Hama',
                        //textHint: "Enter Product Title",
                        //controller: productNameController
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),



//                      SizedBox(
//                        height: 16,
//                      ),
//                      Text(
//                        'Lengkapi Kriteria Tumbuhan',
//                        style: CustomTextStyle.textFormFieldBold
//                            .copyWith(color: Colors.black, fontSize: 15),
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Nama Tumbuhan',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Media Semai',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Waktu Semai',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'PH Ideal',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'PPM Ideal',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Jenis Pupuk',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Dosis Pupuk',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Waktu Pemberian Pupuk Tahap 1',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Waktu Pemberian Pupuk Tahap 2',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Waktu Pemberian Pupuk Tahap 3',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Waktu Panen',
//                        //controller: model.nameController
//                      ),
//                      SizedBox(
//                        height: 16,
//                      ),
//                      CustomizedTextField(
//                        label: 'Jenis Hama',
//                        //controller: model.nameController
//                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            //disini
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

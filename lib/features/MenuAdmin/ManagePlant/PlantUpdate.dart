import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/AdminOrderDetails.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePlant extends StatefulWidget {
  final Plants plant;

  const UpdatePlant({Key key, this.plant}) : super(key: key);
  @override
  _UpdatePlantState createState() => _UpdatePlantState();
}

class _UpdatePlantState extends State<UpdatePlant> {
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
  TextEditingController waktuPanenhariController = TextEditingController();
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
        StorageUploadTask task1 =
        storage.ref().child("Plants").child(picture1).putFile(_image);
        StorageTaskSnapshot snapshot1 =
        await task1.onComplete.then((snapshot) => snapshot);

        task1.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          _plantService.editPlant({
            "Plant": namaTumbuhanController.text,
            "Media": mediaSemaiController.text,
            "SeedingTime": waktuSemaiController.text,
            "Image": imageUrl1,
            "PPM": ppmIdealController.text,
            "PH": phIdealController.text,
            "FertilizerType": jenisPupukController.text,
            "TimeOfFertilizer": waktuPupukController.text,
            "DosageOfFertilizer": dosisPupukController.text,
            "HarvestTime": waktuPanenController.text,
            "HarvestDay": int.parse(waktuPanenhariController.text),
            "PestType": jenisHamaController.text,
          },widget.plant.id);
          _formKey.currentState.reset();
          setState(() => isLoading = false);
          Navigator.pop(context);
        });
      } else if(_image==null) {
        _plantService.editPlant({
          "Plant": namaTumbuhanController.text,
          "Media": mediaSemaiController.text,
          "SeedingTime": waktuSemaiController.text,
          "Image": widget.plant.image,
          "PPM": ppmIdealController.text,
          "PH": phIdealController.text,
          "FertilizerType": jenisPupukController.text,
          "TimeOfFertilizer": waktuPupukController.text,
          "DosageOfFertilizer": dosisPupukController.text,
          "HarvestTime": waktuPanenController.text,
          "HarvestDay": int.parse(waktuPanenhariController.text),
          "PestType": jenisHamaController.text,
        },widget.plant.id);
        _formKey.currentState.reset();
        setState(() => isLoading = false);
        Navigator.pop(context);
      }else{
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenTosca,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Update Plant",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: SafeArea(
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
                              child: Image.network(
                                widget.plant.image,
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
                    UpdateFormTextField(
                        textLabel: 'Nama Tumbuhan',
                        textHint: widget.plant.plant,
                        controller: namaTumbuhanController,
                        value: widget.plant.plant),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Media Semai',
                        textHint: widget.plant.media,
                        controller: mediaSemaiController,
                      value:widget.plant.media
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Waktu Semai',
                        textHint: widget.plant.seedingTime,
                        controller: waktuSemaiController,
                      value: widget.plant.seedingTime
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'PH Ideal',
                        textHint: widget.plant.ph,
                        controller: phIdealController,
                      value: widget.plant.ph
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'PPM Ideal',
                        textHint: widget.plant.ppm,
                        controller: ppmIdealController,
                      value: widget.plant.ppm
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Jenis Pupuk',
                        textHint: widget.plant.fertilizerType,
                        controller: jenisPupukController,
                    value:widget.plant.fertilizerType),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Dosis Pupuk',
                        textHint: widget.plant.dosageFertilizer,
                        controller: dosisPupukController,
                    value:widget.plant.dosageFertilizer),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Waktu Pupuk',
                        textHint: widget.plant.timeOfFertilizer,
                        value:  widget.plant.timeOfFertilizer,
                        controller: waktuPupukController),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Waktu Panen',
                        textHint: widget.plant.harvestTime,
                        controller: waktuPanenController,
                      value:widget.plant.harvestTime
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Waktu Panen Satuan Hari',
                        textHint: widget.plant.harvestDay.toString(),
                        controller: waktuPanenhariController,
                        value: widget.plant.harvestDay.toString(),
                        textType: TextInputType.number),
                    new SizedBox(
                      height: 16.0,
                    ),
                    UpdateFormTextField(
                        textLabel: 'Jenis Hama',
                        textHint: widget.plant.pestsType,
                        value: widget.plant.pestsType,
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Update Plant",
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
      ),
    );
  }
}

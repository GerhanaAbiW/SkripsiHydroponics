import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/Costumized_Text_Field.dart';
import 'package:hydroponics/features/MenuAdmin/AddArticle/AddArticle_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddArticleView extends StatefulWidget {
  @override
  _AddArticleViewState createState() => _AddArticleViewState();
}

class _AddArticleViewState extends State<AddArticleView> {
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
  TextEditingController titleController= TextEditingController();
  TextEditingController articleController= TextEditingController();
  TextEditingController authorController= TextEditingController();
  TextEditingController dateController = new TextEditingController();

  ArticleService articleService = ArticleService();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.value = TextEditingValue(text: DateFormat('dd/MM/yyyy').format(picked).toString());
      });
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image);
          StorageTaskSnapshot snapshot1 = await task1.onComplete.then((snapshot) => snapshot);

          task1.onComplete.then((snapshot3) async {

            imageUrl1 = await snapshot1.ref.getDownloadURL();
            articleService.uploadArticle({
              "title":titleController.text,
              "author":authorController.text,
              "date":dateController.text,
              "picture":imageUrl1,
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
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                          Text(
                            'Lengkapi Data Untuk Article',
                            style: CustomTextStyle.textFormFieldBold
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: 16,
                          ),
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
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 3,
                                    ),
                                  )
                                      : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              child: FlatButton(
                                color: Colors.lightGreenAccent,
                                child: Text('Choose Image'),
                                onPressed: () {
                                  myAlert();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            // validator: (value) => emptyValidation(value),
                            decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: dateController,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: 'Date of Birth',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
//                        Container(
//                          decoration: BoxDecoration(
//                            border: Border(
//                                bottom: BorderSide(
//                              width: 1,
//                              color: GreenTosca,
//                            )),
//                          ),
//                          child: Stack(
//                            alignment: Alignment.topLeft,
//                            children: <Widget>[
//                              Text(
//                                'Tanggal Lahir',
//                                style: CustomTextStyle.textFormFieldBold
//                                    .copyWith(
//                                        color: Colors.black, fontSize: 15),
//                              ),
//                              SizedBox(
//                                height: 12,
//                              ),
//                              Stack(
//                                alignment: Alignment.centerLeft,
//                                children: <Widget>[
//                                  // Provider.of<AddArticleViewModel>(context,listen: false).dateFormat.format();
//                                  Text(model.dateFormat
//                                      .format(model.selectedDate)),
//                                  FlatButton(
//                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
//                                    child: Align(
//                                      alignment: Alignment.bottomRight,
//                                      child: Icon(Icons.arrow_drop_down),
//                                      // child: Image(
//                                      //   image: arrow,
//                                      //   width: 56,
//                                      //   height: 56,
//                                      // ),
//                                    ),
//                                    onPressed: () => model.selectDate(context),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            // validator: (value) => emptyValidation(value),
                            decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                           // validator: (value) => emptyValidation(value),
                            decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            // validator: (value) => emptyValidation(value),
                            decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: (){
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
                                "Add Plant",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                  ],
                ),
              ),
            ),
          ),

    );
  }
}

class CommonStyle{
  static InputDecoration textFieldStyle({String labelTextStr="",String hintTextStr=""}) {return InputDecoration(
    contentPadding: EdgeInsets.all(12),
    labelText: labelTextStr,
    labelStyle: TextStyle(
     color: Colors.green
    ),
    hintText:hintTextStr,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.green,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
  );
  }
}
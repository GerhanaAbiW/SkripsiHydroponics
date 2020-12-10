import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/AdminOrderDetails.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';

class ArticleUpdate extends StatefulWidget {
  final Article article;

  const ArticleUpdate({Key key, this.article}) : super(key: key);
  @override
  _ArticleUpdateState createState() => _ArticleUpdateState();
}

class _ArticleUpdateState extends State<ArticleUpdate> {
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController articleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController dateController = new TextEditingController();

  ArticleService articleService = ArticleService();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



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
        StorageUploadTask task1 = storage.ref().child("Articles").child(picture1).putFile(_image);
        StorageTaskSnapshot snapshot1 =
        await task1.onComplete.then((snapshot) => snapshot);

        task1.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          articleService.editArticle({
            "title": titleController.text,
            "author": authorController.text,
            "date": dateController.text,
            "description": descController.text,
            "image": imageUrl1,

          },widget.article.id);
          _formKey.currentState.reset();
          setState(() => isLoading = false);
          Navigator.pop(context);
        });
      } else {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Update Article",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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
                              widget.article.image,
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
                          width: MediaQuery.of(context).size.width / 3,
                          height: 50.0,
                          child: FlatButton(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.white)),
                            color: GreenTosca,
                            child: Icon(Icons.camera_alt, color: white),
                            onPressed: () {
                              myAlert();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FormTextField(
                      textLabel: "Judul Article ",
                      textHint: "Masukkan Judul Article",
                      //value: widget.article.title,
                      controller: titleController),
                  SizedBox(
                    height: 16,
                  ),
                  DateFormField(
                      textLabel: 'Tanggal Terbit',
                      textHint: 'Tanggal Terbit',
                      //value: widget.article.date,
                      controller: dateController),
                  SizedBox(
                    height: 16,
                  ),
                  FormTextField(
                      textLabel: "Pengarang",
                      textHint: "Masukkan Nama Pengarang",
                      controller: authorController),
                  SizedBox(
                    height: 16,
                  ),
                  MultilineFormTextField(
                      controller: descController,
                      textHint: "Masukkan Isi Konten",
                      //value: widget.article.description,
                      textLabel: "Konten",
                      height: 10),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      validateAndUpload();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: GreenTosca,
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Update Article",
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
      ),
    );
  }
}






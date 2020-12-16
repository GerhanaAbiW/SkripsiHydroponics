import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/DashboardUserOrder.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/ProductOrderUser/UserOrderList.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';

class UploadPayment extends StatefulWidget {
  final String id;
  const UploadPayment({Key key, this.id}) : super(key: key);
  @override
  _UploadPaymentState createState() => _UploadPaymentState();
}

class _UploadPaymentState extends State<UploadPayment> {
  File _image;
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image != null) {
        String imageUrl1;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 =
            "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task1 =
            storage.ref().child("Payment").child(picture1).putFile(_image);
        StorageTaskSnapshot snapshot1 =
            await task1.onComplete.then((snapshot) => snapshot);

        task1.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          _orderServices.updateOrder(
              status: "Proccess", id: widget.id, img: imageUrl1);
          _formKey.currentState.reset();
          setState(() => isLoading = false);
          changeScreen(context, UserOrderList());
        });
      } else {
        setState(() => isLoading = false);
      }
    }
  }

  Future getImage(ImageSource media) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: media);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  OrderServices _orderServices = OrderServices();
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

  Widget _displayChild1() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellowColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Upload Transaction Payment',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text("Upload Your Transaction Payment Here"),
                SizedBox(
                  height: 16,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.black, //Colors.blue,
                  size: 24.0,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.height / 2,
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: OutlineButton(
                      borderSide:
                          BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {
                        myAlert();
                      },
                      child: _displayChild1()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonButtom(
                color: darkYellowColor,
                buttonText: 'Upload Now',
                onPressed: () {
                  validateAndUpload();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MenuOrderViewModel extends ChangeNotifier {
  Uint8List profileImage;
  String imageUrl;
  http.MultipartFile image;
  PickedFile pickedImage;
  //File _video;
  DateTime selectedDate = DateTime.now();
  String birthDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  init() async {}

  selectImage() async {
    pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    profileImage = await pickedImage.readAsBytes();

    notifyListeners();
  }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:video_player/video_player.dart';

class AddArticleViewModel extends ChangeNotifier {
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

// pickVideo() async {
//     File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
//      _video = video;
//     _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_) {
//       setState(() { });
//       _videoPlayerController.play();
//     });
// }

// _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)..initialize().then((_) {
//     setState(() { });
//     _cameraVideoPlayerController.play();
// });

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      birthDate = DateFormat('y-MM-dd', 'id_ID').format(picked);
      print('birthDate: $birthDate');
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  ArticleService _articleService = ArticleService();

  ArticleProvider.initialize() {
    _getListArticles();
  }

//  getter
  List<Article> get articles => _articles;

//  methods
  void _getListArticles() async {
    _articles = await _articleService.getListArticles();
    notifyListeners();
  }

// view model
  // Uint8List profileImage;
  // String imageUrl;
  // http.MultipartFile image;
  // PickedFile pickedImage;

  // DateTime selectedDate = DateTime.now();
  // String birthDate;
  // DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  // init() async {}

  // selectImage() async {
  //   pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

  //   profileImage = await pickedImage.readAsBytes();

  //   notifyListeners();
  // }

  // Future<Null> selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(1800),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     birthDate = DateFormat('y-MM-dd', 'id_ID').format(picked);
  //     print('birthDate: $birthDate');
  //     notifyListeners();
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';


class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> _articlesSearched = [];
  ArticleService _articleService = ArticleService();

  ArticleProvider.initialize() {
    _getListArticles();
  }

//  getter
  List<Article> get articles => _articles;
  List<Article> get articlesSearched => _articlesSearched;

//  methods
  Future getListArticles() async {
    _articles = await _articleService.getListArticles();
    notifyListeners();
  }
  void _getListArticles() async {
    _articles = await _articleService.getListArticles();
    notifyListeners();
  }

  Future search({String articleTitle})async{
    _articlesSearched = await _articleService.searchArticles(articleTitle: articleTitle);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${_articlesSearched.length}");
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

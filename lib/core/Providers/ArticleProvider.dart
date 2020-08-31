
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';

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
}
import 'package:flutter/material.dart';

enum Screen { DASH, PRODUCTS, CATEGORIES, BRANDS, ORDERS, AddArticle, AddVideo }

class AppProvider with ChangeNotifier {
  Screen selectedScreen = Screen.DASH;
  bool isLoading = false;

  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  changeScreen(Screen screen) {
    selectedScreen = screen;
    notifyListeners();
  }
}

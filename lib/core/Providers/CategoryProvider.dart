import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Category.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';

class CategoryProvider with ChangeNotifier{
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories()async{
    categories = await _categoryServices.getForModelCategories();
    notifyListeners();
  }
}
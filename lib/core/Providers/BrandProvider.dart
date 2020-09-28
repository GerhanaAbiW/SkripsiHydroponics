import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Brand.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';

class BrandProvider with ChangeNotifier{
  BrandServices _brandServices = BrandServices();
  List<BrandModel> brands = [];

  BrandProvider.initialize(){
    loadBrands();
  }

  loadBrands()async{
    brands = await _brandServices.getForModelBrands();
    notifyListeners();
  }
}
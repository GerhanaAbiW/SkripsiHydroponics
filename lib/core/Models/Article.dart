import 'package:cloud_firestore/cloud_firestore.dart';

class Article{
  static const ID = "id";
  static const CATEGORY = "category";
  static const NAME = "name";
  static const PRICE = "price";
  static const BRAND = "brand";
  static const QUANTITY = "quantity";
  static const PICTURE = "picture";


  String _id;
  String _name;
  String _brand;
  String _category;
  String _picture;
  double _price;
  int _quantity;


//  getters
  String get name => _name;
  String get id => _id;
  String get category => _category;
  String get brand => _brand;
  String get picture => _picture;
  double get price => _price;
  int get quantity => _quantity;


//  named constructure
  Article.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _name = data[NAME];
    _id = data[NAME];
    _category = data[NAME];
    _brand = data[BRAND];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _picture = data[PICTURE];
  }
}
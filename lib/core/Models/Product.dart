import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const QUANTITY = "quantity";
  static const BRAND = "brand";
  static const RATING = "rating";
  static const DATE = "date";



  String _id;
  String _name;
  List _picture;
  String _description;
  String _category;
  String _brand;
  int _quantity;
  int _price;
  int _rating;
  String _date;



  String get id => _id;

  String get name => _name;

  List get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  int get price => _price;

  int get rating => _rating;
  String get date => _date;





  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _brand = snapshot.data[BRAND];
    _description = snapshot.data[DESCRIPTION] ?? " ";
    _price = snapshot.data[PRICE].floor();
    _rating = snapshot.data[RATING];
    _category = snapshot.data[CATEGORY];
    _name = snapshot.data[NAME];
    _picture = snapshot.data[PICTURE];
    _date = snapshot[DATE];


  }
}
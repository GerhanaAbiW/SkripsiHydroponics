import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  static const ID = "id";
  static const BRAND = "brand";
  static const IMAGE = "image";

  int _id;
  String _brand;
  String _image;

  //  getters
  int get id => _id;

  String get brand => _brand;

  String get image => _image;

  BrandModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _brand = snapshot.data[BRAND];
    _image = snapshot.data[IMAGE];
  }
}
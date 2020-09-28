import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Brand.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class BrandServices{
  Firestore _firestore = Firestore.instance;
  String collection = 'brands';

  void createBrand(String name){
    var id = Uuid();
    String brandId = id.v1();

    _firestore.collection(collection).document(brandId).setData({'brand': name});
  }

  Future<List<DocumentSnapshot>> getBrands() => _firestore.collection(collection).getDocuments().then((snaps){
    print(snaps.documents.length);
    return snaps.documents;
  });

  Future<List<BrandModel>> getForModelBrands() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<BrandModel> categories = [];
        for(DocumentSnapshot category in result.documents){
          categories.add(BrandModel.fromSnapshot(category));
        }
        return categories;
      });

  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firestore.collection(collection).where('brand', isEqualTo: suggestion).getDocuments().then((snap){
        return snap.documents;
      });
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class BrandService{
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

  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firestore.collection(collection).where('brand', isEqualTo: suggestion).getDocuments().then((snap){
        return snap.documents;
      });
}
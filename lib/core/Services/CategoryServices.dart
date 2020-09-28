import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Category.dart';
import 'package:uuid/uuid.dart';

class CategoryServices {
  Firestore _firestore = Firestore.instance;
  String collection = 'categories';

  void createCategory(String name) {
    var id = Uuid();
    String categoryId = id.v1();

    _firestore.collection(collection).document(categoryId).setData({'category': name});
  }

  Future<List<DocumentSnapshot>> getCategories() =>
      _firestore.collection(collection).getDocuments().then((snaps) {
        return snaps.documents;
      });

  Future<List<CategoryModel>> getForModelCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CategoryModel> categories = [];
        for(DocumentSnapshot category in result.documents){
          categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });


  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firestore.collection(collection).where('category', isEqualTo: suggestion).getDocuments().then((snap){
        return snap.documents;
      });

}
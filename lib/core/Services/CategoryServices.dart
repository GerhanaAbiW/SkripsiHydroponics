import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
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


  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firestore.collection(collection).where('category', isEqualTo: suggestion).getDocuments().then((snap){
        return snap.documents;
      });

}
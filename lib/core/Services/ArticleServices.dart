import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:uuid/uuid.dart';

class ArticleService {
  Firestore _firestore = Firestore.instance;
  String collection = 'articles';

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String articleId = id.v1();
    data["id"] = articleId;
    _firestore.collection(collection).document(articleId).setData(data);
  }

  Future<List<Article>> getListArticles() =>
      _firestore.collection(collection).getDocuments().then((snap){
        List<Article> listArticles = [];
        snap.documents.map((snapshot) => listArticles.add(Article.fromSnapshot(snapshot)));
        return listArticles;
      });
}
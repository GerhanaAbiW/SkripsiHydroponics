import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:uuid/uuid.dart';

class ArticleService {
  Firestore _firestore = Firestore.instance;
  String collection = 'articles';

  void uploadArticle(Map<String, dynamic> data) {
    var id = Uuid();
    String articleId = id.v1();
    data["id"] = articleId;
    data["createdAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(articleId).setData(data);
  }



  Future<List<Article>> getListArticles() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Article> listArticles = [];
        for (DocumentSnapshot article in result.documents) {
          listArticles.add(Article.fromSnapshot(article));
        }
        return listArticles;
      });

  void editArticle(Map<String, dynamic> data, String articleId) {
    _firestore.collection(collection).document(articleId).updateData(data);
  }
  void deleteArticle(String articleId) {
    _firestore.collection(collection).document(articleId).delete();
  }
}

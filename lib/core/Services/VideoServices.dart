import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:uuid/uuid.dart';

class VideoService {
  Firestore _firestore = Firestore.instance;
  String collection = 'Videos';

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String videoId = id.v1();
    data["id"] = videoId;
    _firestore.collection(collection).document(videoId).setData(data);
  }

  Future<List<Video>> getListVideos() =>
      _firestore.collection(collection).getDocuments().then((snap){
        List<Video> listVideos = [];
        snap.documents.map((snapshot) => listVideos.add(Video.fromSnapshot(snapshot)));
        return listVideos;
      });
}
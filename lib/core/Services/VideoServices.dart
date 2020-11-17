import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:uuid/uuid.dart';

class VideoService {
  Firestore _firestore = Firestore.instance;
  String collection = 'videos';

  void uploadVideo(Map<String, dynamic> data) {
    var id = Uuid();
    String videoId = id.v1();
    data["id"] = videoId;
    _firestore.collection(collection).document(videoId).setData(data);
  }

//  Future<List<Video>> getListVideos() =>
//      _firestore.collection(collection).getDocuments().then((snap){
//        List<Video> listVideos = [];
//        snap.documents.map((snapshot) => listVideos.add(Video.fromSnapshot(snapshot)));
//        return listVideos;
//      });

  Future<List<Video>> getListVideos() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Video> listVideos = [];
        for (DocumentSnapshot video in result.documents) {
          listVideos.add(Video.fromSnapshot(video));
        }
        return listVideos;
      });

  void editVideo(Map<String, dynamic> data) {
    var id = Uuid();
    String videoId = id.v1();
    data["id"] = videoId;
    _firestore.collection(collection).document(videoId).updateData(data);
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:uuid/uuid.dart';

class VideoService {
  Firestore _firestore = Firestore.instance;
  String collection = 'videos';

  void uploadVideo(Map<String, dynamic> data) {
    var id = Uuid();
    String videoId = id.v1();
    data["id"] = videoId;
    data["createdAt"] = FieldValue.serverTimestamp();
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

  void editVideo(Map<String, dynamic> data, String videoId) {
    _firestore.collection(collection).document(videoId).updateData(data);
  }
  void deleteVideo(String videoId) {
    _firestore.collection(collection).document(videoId).delete();
  }
  Future<List<Video>> searchVideos({String videoTitle}) {
    // code to convert the first character to uppercase
    //String searchKey = productName[0].toUpperCase() + productName.substring(1);
    String searchKey = videoTitle[0].toUpperCase() + videoTitle.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("title")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
      List<Video> videos = [];
      for (DocumentSnapshot product in result.documents) {
        videos.add(Video.fromSnapshot(product));
      }

      return videos;

    });
  }
}
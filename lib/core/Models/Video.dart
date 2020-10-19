import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  static const ID = "id";
  static const TITLE = "title";
  static const DATE = "date";
  static const VIDEO = "video";
  static const AUTHOR = "author";
  static const DESCRIPTION = "description";


  String _id;
  String _title;
  String _date;
  String _video;
  String _author;
  String _description;

//  getters
  String get id => _id;
  String get title => _title;
  String get date => _date;
  String get video => _video;
  String get author => _author;
  String get description => _description;

//  named constructure
  Video.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _id = data[ID];
    _title = data[TITLE];
    _date = data[DATE];
    _video = data[VIDEO];
    _author = data[AUTHOR];
    _description = data[DESCRIPTION];
  }
}

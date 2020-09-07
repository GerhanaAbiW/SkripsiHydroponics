import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  static const ID = "id";
  static const TITLE = "title";
  static const DATE = "date";
  static const IMAGE = "image";
  static const AUTHOR = "author";
  static const DESCRIPTION = "description";

  String _id;
  String _title;
  String _date;
  String _image;
  String _author;
  String _description;

//  getters
  String get id => _id;
  String get title => _title;
  String get date => _date;
  String get image => _image;
  String get author => _author;
  String get description => _description;

//  named constructure
  Article.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _id = data[ID];
    _title = data[TITLE];
    _date = data[DATE];
    _image = data[IMAGE];
    _author = data[AUTHOR];
    _description = data[DESCRIPTION];
  }
}

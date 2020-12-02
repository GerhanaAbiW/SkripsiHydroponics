import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const IMAGE = "image";
  static const DATE_TIME = "date";


  String _id;
  String _description;
  String _userId;
  String _status;
  String _dateTime;
  String _image;
  int _total;

//  getters
  String get id => _id;

  String get description => _description;

  String get userId => _userId;

  String get status => _status;

  int get total => _total;

  String get dateTime => _dateTime;
  String get image => _image;

  // public variable



  PaymentModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _dateTime = snapshot.data[DATE_TIME];
    _image = snapshot.data[IMAGE];


  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL_PRICE = "totalPrice";
  static const TOTAL_QUANTITY_PRODUCT = "totalQuantityProduct";
  static const STATUS = "status";
  static const DATE_TIME = "date";


  String _id;
  String _description;
  String _userId;
  String _status;
  String _dateTime;
  int _totalPrice;
  int _totalQuantityProduct;

//  getters
  String get id => _id;

  String get description => _description;

  String get userId => _userId;

  String get status => _status;

  int get totalPrice => _totalPrice;

  String get dateTime => _dateTime;

  int get totalQuantityProduct => _totalQuantityProduct;
  // public variable
  List cart;


  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _totalPrice = snapshot.data[TOTAL_PRICE];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _dateTime = snapshot.data[DATE_TIME];
    _totalQuantityProduct = snapshot.data[TOTAL_QUANTITY_PRODUCT];
    cart = snapshot.data[CART];


  }


}
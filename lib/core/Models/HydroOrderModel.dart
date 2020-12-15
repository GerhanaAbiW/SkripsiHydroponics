import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';

class HydroOrderModel {
  static const ID = "id";
  static const USER_NAME = "userName";
  static const PHONE = "phone";
  static const USER_ADDRESS = "userAddress";
  static const DESCRIPTION = "description";
  static const HYDRO_TYPE = "hydroType";
  static const HYDRO_IMAGE = "hydroImage";
  static const HOLE_QTY= "holeQuantity";
  static const LAND_TYPE=  "landType";
  static const PIPE_QTY=  "pipeQuantity";
  static const IMAGE_PAYMENT = "imagePayment";
  static const InstalationPayment = "paymentInstalation";
  static const DeliveryPayment = "paymentDelivery";
  static const TAX_PAYMENT = "paymentTax";
  static const USER_ID = "userId";
  static const PRICE = "price";
  static const TOTAL_PRICE = "totalPrice";
  static const TOTAL_QUANTITY_PRODUCT = "totalQuantityProduct";
  static const STATUS = "status";
  static const DATE_TIME = "date";


  String _id;
  int _price;
  String _imagePayment;
  String _userName;
  String _phone;
  String _hydroType;

  String get holeQTY => _holeQTY;
  String _holeQTY;
  String _pipeQTY;
  String _landType;

  double _tax;
  String _hydroImage;
  int _delivery;
  int _instalation;
  String _userAddress;
  String _description;
  String _userId;
  String _status;
  String _dateTime;
  double _totalPrice;
  int _totalQuantityProduct;

//  getters
  String get id => _id;
  int get price => _price;
  String get hydroType => _hydroType;
  String get hydroImage => _hydroImage;
  String get imagePayment => _imagePayment;
  String get userName => _userName;
  String get phone => _phone;
  String get userAddress => _userAddress;
  int get delivery => _delivery;

  int get instalation => _instalation;
  double get tax => _tax;
  String get description => _description;

  String get userId => _userId;

  String get status => _status;

  double get totalPrice => _totalPrice;

  String get dateTime => _dateTime;

  int get totalQuantityProduct => _totalQuantityProduct;
  // public variable
  List cart;


  HydroOrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _price = snapshot.data[PRICE];
    _hydroType = snapshot.data[HYDRO_TYPE];
    _hydroImage = snapshot.data[HYDRO_IMAGE];
    _imagePayment = snapshot.data[IMAGE_PAYMENT];
    _userName = snapshot.data[USER_NAME];
    _instalation = snapshot.data[InstalationPayment];
    _delivery = snapshot.data[DeliveryPayment];
    _tax = snapshot.data[TAX_PAYMENT];
    _phone = snapshot.data[PHONE];
    _description = snapshot.data[DESCRIPTION];
    _totalPrice = snapshot.data[TOTAL_PRICE];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _userAddress = snapshot.data[USER_ADDRESS];
    _dateTime = snapshot.data[DATE_TIME];
    _totalQuantityProduct = snapshot.data[TOTAL_QUANTITY_PRODUCT];
    _pipeQTY = snapshot.data[PIPE_QTY];
    _holeQTY = snapshot.data[HOLE_QTY];
    _landType = snapshot.data[LAND_TYPE];


  }

  String get pipeQTY => _pipeQTY;

  String get landType => _landType;
}
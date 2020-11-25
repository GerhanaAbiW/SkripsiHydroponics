import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:uuid/uuid.dart';

class PaymentServices{
  String collection = "payments";
  Firestore _firestore = Firestore.instance;

  void uploadPayment(Map<String, dynamic> data) {
    var id = Uuid();
    String articleId = id.v1();
    data["id"] = articleId;
    data["createdAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(articleId).setData(data);
  }


}
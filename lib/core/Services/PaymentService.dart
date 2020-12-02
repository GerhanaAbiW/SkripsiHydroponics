import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Payment.dart';
import 'package:uuid/uuid.dart';

class PaymentServices{
  String collection = "payments";
  Firestore _firestore = Firestore.instance;

  void uploadPayment(Map<String, dynamic> data) {
    var id = Uuid();
    String paymentId = id.v1();
    data["id"] = paymentId;
    data["createdAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(paymentId).setData(data);
  }

  void updatePayment(String id,Map<String, dynamic> data) {
    data["updatedAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).updateData(data);
  }

  Future<List<PaymentModel>> getUserPayments({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<PaymentModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(PaymentModel.fromSnapshot(order));
        }
        return orders;
      });

  Future<List<PaymentModel>> getAdminPayments() async =>
      _firestore
          .collection(collection)
          .getDocuments()
          .then((result) {
        List<PaymentModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(PaymentModel.fromSnapshot(order));
        }
        return orders;
      });

}
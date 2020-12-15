import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:uuid/uuid.dart';

class HydroOrderServices{
  String collection = "hydroOrders";
  Firestore _firestore = Firestore.instance;
  void createHydroOrder(Map<String, dynamic> data) {
    var uuid = Uuid();
    String id = uuid.v4();
    data["id"] = id;
    data["createdAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).setData(data);
  }

  void updateHydroOrder(Map<String, dynamic> data,String id) {
    data["updatedAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).updateData(data);
  }

  Future<List<HydroOrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<HydroOrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(HydroOrderModel.fromSnapshot(order));
        }
        return orders;
      });


  Future<List<HydroOrderModel>> getBuyers() async =>
      _firestore
          .collection(collection)
          .where("status", isEqualTo: "Paid")
          .getDocuments()
          .then((result) {
        List<HydroOrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(HydroOrderModel.fromSnapshot(order));
        }
        return orders;
      });


  Future<List<HydroOrderModel>> getAdminOrders() async =>
      _firestore
          .collection(collection)
          .getDocuments()
          .then((result) {
        List<HydroOrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(HydroOrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
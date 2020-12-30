import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:uuid/uuid.dart';

class HydroOrderServices {
  String collection = "hydroOrders";
  Firestore _firestore = Firestore.instance;

  void createHydroOrder(Map<String, dynamic> data) {
    var uuid = Uuid();
    String id = uuid.v4();
    data["id"] = id;
    data["createdAt"] = FieldValue.serverTimestamp();
    data["updatedAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).setData(data);
  }

  void updateHydroOrder({String status, String id, String img, String resi}) {
    _firestore.collection(collection).document(id).updateData({
      "status": status,
      "updatedAt": FieldValue.serverTimestamp(),
      "imagePayment": img,
      "resi": resi
    });
  }

  Future<List<HydroOrderModel>>getUserOrders({String userId}) async => _firestore
      .collection(collection)
      .orderBy('updatedAt', descending: true)
      .getDocuments()
      .then((result) {
    List<HydroOrderModel> orders = [];
    for (DocumentSnapshot order in result.documents) {
      if(order.data["userId"]==userId){
        orders.add(HydroOrderModel.fromSnapshot(order));
      }
    }
    return orders;
  });
  // Future<List<HydroOrderModel>> getUserOrders({String userId}) async =>
  //     _firestore
  //         .collection(collection)
  //         .where("userId", isEqualTo: userId)
  //         .getDocuments()
  //         .then((result) {
  //       List<HydroOrderModel> orders = [];
  //       for (DocumentSnapshot order in result.documents) {
  //         orders.add(HydroOrderModel.fromSnapshot(order));
  //       }
  //       return orders;
  //     });

  Future<List<HydroOrderModel>> getBuyers() async => _firestore
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

  Future<List<HydroOrderModel>> getAdminOrders() async => _firestore
          .collection(collection)
          .orderBy('updatedAt', descending: true)
          .getDocuments()
          .then((result) {
        List<HydroOrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(HydroOrderModel.fromSnapshot(order));
        }
        return orders;
      });
}

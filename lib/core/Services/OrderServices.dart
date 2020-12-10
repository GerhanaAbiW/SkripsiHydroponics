
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:uuid/uuid.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId ,String description,String status ,List<CartItemModel> cart, double totalPrice, int totalQtyProduct, String address, String phone }) {
    var uuid = Uuid();
    String id = uuid.v4();
    List<Map> convertedCart = [];

    for(CartItemModel item in cart){
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "phone" : phone,
      "userAddress" : address,
      "id": id,
      "cart": convertedCart,
      "totalPrice": totalPrice,
      "totalQuantityProduct" : totalQtyProduct,
      "createdAt": FieldValue.serverTimestamp(),
      "description": description,
      "status": status,
      "date" : DateTime.now().toString()
    });
  }

  void updateOrder(String id,Map<String, dynamic> data) {
    data["updatedAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).updateData(data);
  } 
  
  void createHydroOrder(Map<String, dynamic> data) {
    var uuid = Uuid();
    String id = uuid.v4();
    data["id"] = id;
    data["createdAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).setData(data);
  }

  void updateHydroOrder(String id,Map<String, dynamic> data) {
    data["updatedAt"] =  FieldValue.serverTimestamp();
    _firestore.collection(collection).document(id).updateData(data);
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

  Future<List<OrderModel>> getBuyers() async =>
      _firestore
          .collection(collection)
          .where("status", isEqualTo: "Accepted")
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });


  Future<List<OrderModel>> getAdminOrders() async =>
      _firestore
          .collection(collection)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

  
}
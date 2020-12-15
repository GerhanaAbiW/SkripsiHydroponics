
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:uuid/uuid.dart';

class OrderServices{
  String collection = "orders";

  Firestore _firestore = Firestore.instance;

  void createOrder({String userId, String userName,String description,List<CartItemModel> cart,
    double totalPrice, int totalQtyProduct, String address, String phone, double tax, int instalation, int delivery}) {
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
      "paymentInstalation": instalation,
      "paymentDelivery" : delivery,
      "paymentTax": tax,
      "id": id,
      "imagePayment":null,
      "cart": convertedCart,
      "totalPrice": totalPrice,
      "totalQuantityProduct" : totalQtyProduct,
      "createdAt": FieldValue.serverTimestamp(),
      "description": description,
      "status": "Pending",
      "date" : DateTime.now().toString()
    });
  }

  void updateOrder({String status,String id, String img}) {
    _firestore.collection(collection).document(id).updateData({"status":status, "updatedAt":FieldValue.serverTimestamp(),"imagePayment":img});
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
          .where("status", isEqualTo: "Paid")
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
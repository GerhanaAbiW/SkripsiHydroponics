
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    data["createdAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(productId).setData(data);
  }

  void updateProduct(Map<String, dynamic> data, String productId) {
    data["updatedAt"] = FieldValue.serverTimestamp();
    _firestore.collection(collection).document(productId).updateData(data);
  }
  void deleteProduct(Map<String, dynamic> data, String productId) {
    _firestore.collection(collection).document(productId).delete();
  }

  Future<List<ProductModel>> getProductsOfCategory({String category}) async =>
      _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .getDocuments()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    //String searchKey = productName[0].toUpperCase() + productName.substring(1);
    String searchKey = productName[0].toLowerCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
      List<ProductModel> products = [];
      for (DocumentSnapshot product in result.documents) {
        products.add(ProductModel.fromSnapshot(product));
      }

      return products;

    });
  }
}
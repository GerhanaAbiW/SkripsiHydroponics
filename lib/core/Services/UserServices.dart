import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/FavoriteProduct.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';
import 'package:hydroponics/core/Models/User.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "users";



  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).document(id).get().then((document){
    return UserModel.fromSnapshot(document);
  });

  Future<List<UserModel>> getListUsers() async =>
      _firestore.collection(collection).where("role", isEqualTo: "user").getDocuments().then((result) {
        List<UserModel> listUsers = [];
        for (DocumentSnapshot user in result.documents) {
          listUsers.add(UserModel.fromSnapshot(user));
        }
        return listUsers;
      });


  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }


  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

  void addToFavorite({String userId, FavoriteProductModel favoriteProductModel}){
    _firestore.collection(collection).document(userId).updateData({
      "favoriteProduct": FieldValue.arrayUnion([favoriteProductModel.toMap()])
    });
  }


  void removeFromFavorite({String userId, FavoriteProductModel favoriteProductModel}){
    _firestore.collection(collection).document(userId).updateData({
      "favoriteProduct": FieldValue.arrayRemove([favoriteProductModel.toMap()])
    });
  }

  void addMyPlant({String userId, MyPlantsModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "myPlants": FieldValue.arrayUnion([plantItem.toMap()])
    });
  }
  void deleteMyPlant({String userId, MyPlantsModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "myPlants": FieldValue.arrayRemove([plantItem.toMap()])
    });
  }
  void addMyPlantRecord({String userId, MyPlantsRecordModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "myPlantsRecord": FieldValue.arrayUnion([plantItem.toMap()])
    });
  }
  void deleteMyPlantRecord({String userId, MyPlantsRecordModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "myPlantsRecord": FieldValue.arrayRemove([plantItem.toMap()])
    });
  }
}
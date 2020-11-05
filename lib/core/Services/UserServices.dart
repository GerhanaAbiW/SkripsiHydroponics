import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/User.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "users";



  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).document(id).get().then((document){
    return UserModel.fromSnapshot(document);
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
  void addMyPlant({String userId, MyPlantsModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([plantItem.toMap()])
    });
  }
  void deleteMyPlant({String userId, MyPlantsModel plantItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([plantItem.toMap()])
    });
  }
}
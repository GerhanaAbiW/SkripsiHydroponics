// import 'dart:async';
// import 'dart:typed_data';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsUserRecord.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';
import 'package:hydroponics/core/Services/UserServices.dart';
import 'package:hydroponics/features/LoginRegister/Login.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  Uint8List profileImage;
  String imageUrl;
  http.MultipartFile image;
  PickedFile pickedImage;

  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  Firestore _firestore = Firestore.instance;
  UserModel _userModel;

//  getter
  UserModel get userModel => _userModel;

  Status get status => _status;

  FirebaseUser get user => _user;

  // public variables
  List<OrderModel> orders = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  //init() async {}

  selectImage() async {
    pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    profileImage = await pickedImage.readAsBytes();

    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        _firestore.collection('users').document(user.user.uid).setData({
          "name": name,
          "email": email,
          "role": "admin",
          "uid": user.user.uid,
          "stripeId": ""
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut(context) async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    changeScreenReplacement(context, LoginPage());
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({ProductModel product, int qty}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.picture[0],
        "productId": product.id,
        "price": product.price,
        "quantity": qty,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> addMyPlant({Plants plant}) async {
    try {
      var uuid = Uuid();
      String myPlantId = uuid.v4();
      List<MyPlantsModel> myPlant = _userModel.myPlant;

      Map plantItem = {
        "id": myPlantId,
        "PlantId": plant.id,
        "Plant": plant.plant,
        "Media": plant.media,
        "Image": plant.image,
        "PPM": plant.ppm,
        "PH": plant.ph,
        "FertilizerType": plant.fertilizerType,
        "TimeOfFertilizer": plant.timeOfFertilizer,
        "DosageOfFertilizer": plant.dosageFertilizer,
        "HarvestTime": plant.harvestTime,
        "PestType": plant.pestsType,
        "CreatedAt" : DateTime.now().microsecondsSinceEpoch
      };

      MyPlantsModel item = MyPlantsModel.fromMap(plantItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${myPlant.toString()}");
      _userServices.addMyPlant(userId: _user.uid, plantItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> deleteMyPlant({MyPlantsModel plantItem}) async {
    print("THE PRODUC IS: ${plantItem.toString()}");

    try {
      _userServices.deleteMyPlant(userId: _user.uid, plantItem: plantItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> addMyPlantRecord({
    MyPlantsModel myPlants,
    bool mediaSemai,
    bool waktuSemai,
    bool jenisPupuk,
    bool dosisPupuk,
    bool waktuPupuk,
    bool waktuPanen,
    bool phIdeal,
    bool ppmIdeal,
  }) async {
    try {
      var uuid = Uuid();
      String myPlantId = uuid.v4();
      List<MyPlantsRecordModel> myPlant = _userModel.myPlantsRecord;

      Map plantItem = {
        "id": myPlantId,
        "PlantId": myPlants.id,
        "Plant": myPlants.plant,
        "Media": myPlants.media,
        "Image": myPlants.image,
        "PPM": myPlants.ppm,
        "PH": myPlants.ph,
        "FertilizerType": myPlants.fertilizerType,
        "TimeOfFertilizer": myPlants.timeOfFertilizer,
        "DosageOfFertilizer": myPlants.dosageFertilizer,
        "HarvestTime": myPlants.harvestTime,
        "PestType": myPlants.pestsType,
        "RecordMedia": mediaSemai,
        "RecordPPM": ppmIdeal,
        "RecordPH": phIdeal,
        "RecordFertilizerType": jenisPupuk,
        "RecordTimeOfFertilizer": waktuPupuk,
        "RecordDosageFertilizer": dosisPupuk,
        "RecordHarvestTime": waktuPanen,
        "RecordPestsType": waktuSemai
      };

      MyPlantsRecordModel item = MyPlantsRecordModel.fromMap(plantItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${myPlant.toString()}");
      _userServices.addMyPlantRecord(userId: _user.uid, plantItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> deleteMyPlantRecord({MyPlantsRecordModel plantItem}) async {
    print("THE PRODUC IS: ${plantItem.toString()}");

    try {
      _userServices.deleteMyPlantRecord(userId: _user.uid, plantItem: plantItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(_user.uid);
    notifyListeners();
  }

  Future<void> updateUser(String name, String email) async {
    _firestore.collection('users').document(_user.uid).updateData({
      "name": name,
      "email": email,
      "role": "user",
      "uid": _user.uid,
      "stripeId": ""
    });
    //var user = await _auth.currentUser();

    _user.updateProfile(UserUpdateInfo()..displayName = name);
    _user.updateEmail(email);
    notifyListeners();
  }
}

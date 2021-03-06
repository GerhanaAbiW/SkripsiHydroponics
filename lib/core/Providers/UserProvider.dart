import 'dart:typed_data';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/FavoriteProduct.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';
import 'package:hydroponics/core/Models/Payment.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Services/HydroOrderService.dart';
import 'package:hydroponics/core/Services/PaymentService.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
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
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  HydroOrderServices _hydroOrderServices = HydroOrderServices();
  PaymentServices _paymentServices = PaymentServices();
  ProductServices _productServices = ProductServices();
  Firestore _firestore = Firestore.instance;
  UserModel _userModel;
  List<UserModel> _listUserModel;

//  getter
  UserModel get userModel => _userModel;
  List<UserModel> get listUserModel => _listUserModel;

  Status get status => _status;

  FirebaseUser get user => _user;

  // public variables
  List<OrderModel> orders = [];
  List<HydroOrderModel> hydroOrders = [];
  List<PaymentModel> payments = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
    _getListUsers();
  }

  void _getListUsers() async {
    _listUserModel = await _userServices.getListUsers();
    notifyListeners();
  }

  //init() async {}

  Future<bool> signIn(String email, String password, GlobalKey<ScaffoldState> _key) async {
    try {
      _status = Status.Authenticating;
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => reloadUserModel());

      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      showSnackBar(e.toString(), _key);
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
          "role": "user",
          "uid": user.user.uid,
          "userPicture": null,
          "address":null,
          "phone":null,
          "gender":null,
          "dob":null,
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
    _status = Status.Unauthenticated;
    await _auth.signOut().then((value) => changeScreenReplacement(context, LoginPage()));
    _user =  await _auth.currentUser();
    notifyListeners();
    //
    return Future.delayed(Duration.zero);
  }

  Future <bool>sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
    //return
  }
  Future <bool>resetPassword(String password) async {
    try{
      _user.updatePassword(password);
        //Create an instance of the current user.
        // FirebaseUser user = await FirebaseAuth.instance.currentUser();
        //
        // //Pass in the password to updatePassword.
        // user.updatePassword(password).then((_){
        //   print("Succesfull changed password");
        // }).catchError((error){
        //   print("Password can't be changed" + error.toString());
        //   //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
        // });

      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
    //return
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
        "id" : cartItemId,
        "name" : product.name,
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

  Future<bool> addToCart2({FavoriteProductModel product, int qty}) async {
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
        "productCategory" : product.category
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

  Future<bool> addToFavoriteProduct({ProductModel product}) async {
    try {
      var uuid = Uuid();
      String favoriteItemId = uuid.v4();
      List<FavoriteProductModel> favorite = _userModel.favorite;
      bool fav = true;

      Map favoriteItem = {
        "id": favoriteItemId,
        "productID": product.id,
        "name": product.name,
        "price": product.price,
        "picture": product.picture,
        "description": product.description,
        "rating": product.rating,
        "quantity": product.quantity,
        "brand": product.brand,
        "category": product.category,
      };

      FavoriteProductModel item = FavoriteProductModel.fromMap(favoriteItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${favorite.toString()}");

      _userServices.addToFavorite(
          userId: _user.uid, favoriteProductModel: item);
      _productServices.updateProduct({
        "id": product.id,
        "name": product.name,
        "price": product.price,
        "picture": product.picture,
        "description": product.description,
        "rating": product.rating,
        "quantity": product.quantity,
        "brand": product.brand,
        "category": product.category,
        //"favorite": fav
      }, product.id);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromFavoriteProduct({FavoriteProductModel product}) async {
    print("THE PRODUC IS: ${product.toString()}");
    bool fav = false;

    try {
      _userServices.removeFromFavorite(
          userId: _user.uid, favoriteProductModel: product);
      _productServices.updateProduct({
        "id": product.id,
        "name": product.name,
        "price": product.price,
        "picture": product.picture,
        "description": product.description,
        "rating": product.rating,
        "quantity": product.quantity,
        "brand": product.brand,
        "category": product.category,
        //"favorite": fav
      }, product.id);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> addMyPlant({Plants plant, String harvestDay}) async {
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
        "SeedingTime": plant.seedingTime,
        "HarvestDay": harvestDay,
        "Date": DateTime.now().toString(),
        "CreatedAt": FieldValue.serverTimestamp()
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
    String status,
    String img,
    String description,
  }) async {
    try {
      var uuid = Uuid();
      String myPlantId = uuid.v4();
      List<MyPlantsRecordModel> myPlant = _userModel.myPlantsRecord;
       DateTime now = DateTime.now();
       DateFormat formatter = DateFormat('dd-MMM-yyyy');
       String date = formatter.format(now);
      Map plantItem = {
        "id": myPlantId,
        "PlantId": myPlants.id,
        "Plant": myPlants.plant,
        "Media": myPlants.media,
        "Image": img,
        "Description" : description,
        "PPM": myPlants.ppm,
        "PH": myPlants.ph,
        "SeedingTime": myPlants.seedingTime,
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
        "RecordPestsType": waktuSemai,
        "Date": date,
        "Status" : status,
        "CreatedAt": FieldValue.serverTimestamp()
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
      _userServices.deleteMyPlantRecord(
          userId: _user.uid, plantItem: plantItem);
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

  getHydroOrders() async {
    hydroOrders = await _hydroOrderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  getPayments() async {
    payments = await _paymentServices.getUserPayments(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(_user.uid);
    notifyListeners();
  }

  Future<void> updateUser({String name, String email, String img, String role, String address, String phone, String gender, String dob}) async {
    _firestore.collection('users').document(_user.uid).updateData({
      "name": name,
      "email": email,
      "address" : address,
      "userPicture": img,
      "role": role,
      "phone": phone,
      "dob": dob,
      "gender": gender,
      "uid": _user.uid,
      "updateAt": FieldValue.serverTimestamp()
    });
    //var user = await _auth.currentUser();

   // _user.updateProfile(UserUpdateInfo()..);
    _user.updateEmail(email);
    notifyListeners();
  }
}

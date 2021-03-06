import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/FavoriteProduct.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';





class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const DOB = "dob";
  static const GENDER = "gender";
  static const ADDRESS = "address";
  static const PHONE = "phone";
  static const EMAIL = "email";
  static const ROLE = "role";
  static const USER_PICTURE = "userPicture";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const FAVORITE = "favorite";
  static const MyPlants = "myPlants";
  static const MyPlantsRecord = "myPlantsRecord";



  String _name;
  String _address;
  String _phone;
  String _email;
  String _dob;
  String _role;
  String _userPicture;
  String _id;
  String _gender;
  String _stripeId;
  int _priceSum = 0;



//  getters
  String get name => _name;
  String get dob => _dob;
  String get gender => _gender;
  String get phone => _phone;
  String get address => _address;

  String get email => _email;
  String get role => _role;
  String get userPicture => _userPicture;

  String get id => _id;

  String get stripeId => _stripeId;


  // public variables
  List<CartItemModel> cart;
  List<FavoriteProductModel> favorite;
  List<MyPlantsModel> myPlant;
  List<MyPlantsRecordModel> myPlantsRecord;
  List<MyPlantsRecordModel> myFailPlantsRecord;


  int totalCartPrice;



  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _phone = snapshot.data[PHONE];
    _address = snapshot.data[ADDRESS];
    _email = snapshot.data[EMAIL];
    _dob = snapshot.data[DOB];
    _role = snapshot.data[ROLE];
    _userPicture = snapshot.data[USER_PICTURE];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot.data[CART]?? []);
    favorite = _convertFavoriteItems(snapshot.data[FAVORITE]?? []);
    myPlant = _convertMyPlants(snapshot.data[MyPlants]?? []);
    myPlantsRecord = _convertMyPlantsRecord(snapshot.data[MyPlantsRecord]?? []);
    myFailPlantsRecord = _convertMyFailPlantsRecord(snapshot.data[MyPlantsRecord]?? []);
    totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);

  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  List<FavoriteProductModel> _convertFavoriteItems(List favorite){
    List<FavoriteProductModel> convertedFavorite = [];
    for(Map favoriteItem in favorite){
      convertedFavorite.add(FavoriteProductModel.fromMap(favoriteItem));
    }
    return convertedFavorite;
  }

  List<MyPlantsModel> _convertMyPlants(List plant){
    List<MyPlantsModel> convertedPlant = [];
    for(Map plantItem in plant){
      convertedPlant.add(MyPlantsModel.fromMap(plantItem));
    }
    return convertedPlant;
  }


  List<MyPlantsRecordModel> _convertMyPlantsRecord(List plantRecord){
    List<MyPlantsRecordModel> convertedPlantRecord = [];
    for(Map plantRecordItem in plantRecord){
      if(plantRecordItem["Status"]=="Harvest"){
        convertedPlantRecord.add(MyPlantsRecordModel.fromMap(plantRecordItem));
      }
    }
    return convertedPlantRecord;
  }

  List<MyPlantsRecordModel> _convertMyFailPlantsRecord(List plantRecord){
    List<MyPlantsRecordModel> convertedPlantRecord = [];
    for(Map plantRecordItem in plantRecord){
      if(plantRecordItem["Status"]=="Crop Failure"){
        convertedPlantRecord.add(MyPlantsRecordModel.fromMap(plantRecordItem));
      }
    }
    return convertedPlantRecord;
  }

  int getTotalPrice({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"]* cartItem["quantity"];
    }

    int total = _priceSum;
    return total;
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';





class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ROLE = "role";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const MyPlants = "myPlants";
  static const MyPlantsRecord = "myPlantsRecord";



  String _name;
  String _email;
  String _role;
  String _id;
  String _stripeId;
  int _priceSum = 0;


//  getters
  String get name => _name;

  String get email => _email;
  String get role => _role;

  String get id => _id;

  String get stripeId => _stripeId;

  // public variables
  List<CartItemModel> cart;
  List<MyPlantsModel> myPlant;
  List<MyPlantsRecordModel> myPlantsRecord;


  int totalCartPrice;



  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _role = snapshot.data[ROLE];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot.data[CART]?? []);
    myPlant = _convertMyPlants(snapshot.data[MyPlants]?? []);
    myPlantsRecord = _convertMyPlantsRecord(snapshot.data[MyPlantsRecord]?? []);
    totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);

  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
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
      convertedPlantRecord.add(MyPlantsRecordModel.fromMap(plantRecordItem));
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
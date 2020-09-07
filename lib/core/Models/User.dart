import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Cart.dart';



class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ROLE = "role";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";


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
  int totalCartPrice;



  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _email = snapshot.data[ROLE];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot.data[CART]?? []);
    totalCartPrice = snapshot.data[CART] == null ? 0 :getTotalPrice(cart: snapshot.data[CART]);

  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
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
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  List<OrderModel> _buyers = [];
  double _revenue = 0;
  int _sales = 0;
  int _bibit = 0;
  int _obat = 0;
  int _pupuk = 0;
  int _alat = 0;
  OrderServices _orderServices = OrderServices();

  OrderProvider.initialize() {
    _getListOrders();
    _getListBuyers();
  }

//  getter
  List<OrderModel> get orders => _orders;

  List<OrderModel> get buyers => _buyers;

  int get sales => _sales;

  double get revenue => _revenue;

  int get obat => _obat;

  int get bibit => _bibit;

  int get pupuk => _pupuk;

  int get alat => _alat;


//  methods
  void _getListOrders() async {
    _orders = await _orderServices.getAdminOrders();
    notifyListeners();
  }

  void _getListBuyers() async {
    _buyers = await _orderServices.getBuyers();

    notifyListeners();
  }

  void getRevenue() {
    for (int i = 0; i < _buyers.length; i++) {
      _revenue = _buyers[i].totalPrice + _buyers[i + 1].totalPrice;
    }
    notifyListeners();
  }

  void getSales() {
    for (int i = 0; i < _buyers.length; i++) {
      _sales = _buyers[i].totalQuantityProduct + _buyers[i + 1].totalQuantityProduct;
    }
    notifyListeners();
  }

  void getCategory() {
    List<CartItemModel> cart;
    for (int i = 0; i < _buyers.length; i++) {
      if (_buyers[i].cart != null || _buyers[i].cart != []) {
        _buyers[i].cart = cart;
        if (cart[i].productCategory == "Bibit") {
          _bibit = _bibit + 1;
        } else if (cart[i].productCategory == "Pupuk") {
          _pupuk = _pupuk + 1;
        } else if (cart[i].productCategory == "Obat") {
          _obat = _obat + 1;
        } else if (cart[i].productCategory == "Alat") {
          _alat = _alat + 1;
        }
      }else{
        print("haha");
    }
  }

  notifyListeners();
}


}

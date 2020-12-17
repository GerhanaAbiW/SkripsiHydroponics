import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  List<OrderModel> _buyers = [];


  double _revenue = 0;
  int _sales = 0;

  OrderServices _orderServices = OrderServices();

  OrderProvider.initialize() {
    _getListOrders();
    _getListBuyers();
  }

//  getter
  List<OrderModel> get orders => _orders;


  List<OrderModel> get buyers => _buyers;

  double get revenue => _revenue;
  int get sales => _sales;


  // int get sales => _sales;
  //
  // double get revenue => _revenue;
  //
  // int get obat => _obat;
  //
  // int get bibit => _bibit;
  //
  // int get pupuk => _pupuk;
  //
  // int get alat => _alat;


//  methods
  void _getListOrders() async {
    _orders = await _orderServices.getAdminOrders();
    notifyListeners();
  }

  void _getListOrderBuyers() async {
    _orders = await _orderServices.getAdminOrders();
    notifyListeners();
  }

  void _getListBuyers() async {
    _buyers = await _orderServices.getBuyers();

    for (int i = 0; i < _buyers.length; i++) {
      _revenue += _buyers[i].totalPrice;
      _sales += _buyers[i].totalQuantityProduct;
    }

    notifyListeners();
  }


}

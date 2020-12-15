import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  List<OrderModel> _buyers = [];

  OrderServices _orderServices = OrderServices();

  OrderProvider.initialize() {
    _getListOrders();
    _getListBuyers();
  }

//  getter
  List<OrderModel> get orders => _orders;

  List<OrderModel> get buyers => _buyers;

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

  void _getListBuyers() async {
    _buyers = await _orderServices.getBuyers();

    notifyListeners();
  }




}

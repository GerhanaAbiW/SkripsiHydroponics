import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  OrderServices _orderServices = OrderServices();

  OrderProvider.initialize() {
    _getListOrders();
  }

//  getter
  List<OrderModel> get orders => _orders;

//  methods
  void _getListOrders() async {
    _orders = await _orderServices.getAdminOrders();
    notifyListeners();
  }
}
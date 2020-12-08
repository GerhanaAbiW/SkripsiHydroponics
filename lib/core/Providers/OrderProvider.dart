import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  List<OrderModel> _buyers = [];
  int _revenue=0;
  int _sales=0;
  OrderServices _orderServices = OrderServices();

  OrderProvider.initialize() {
    _getListOrders();
    _getListBuyers();
  }

//  getter
  List<OrderModel> get orders => _orders;
  List<OrderModel> get buyers => _buyers;
  int get sales => _sales;
  int get revenue => _revenue;

//  methods
  void _getListOrders() async {
    _orders = await _orderServices.getAdminOrders();
    notifyListeners();
  }

  void _getListBuyers() async {
    _buyers = await _orderServices.getBuyers();
    notifyListeners();
  }
  void getRevenue(){
    for(int i = 0; i<_buyers.length; i++){
      _revenue = buyers[i].totalPrice + buyers[i+1].totalPrice;
    }
    notifyListeners();
  }
  void getSales(){
    for(int i = 0; i<_buyers.length; i++){
      _sales = buyers[i].totalQuantityProduct + buyers[i+1].totalQuantityProduct;
    }
    notifyListeners();
  }
}
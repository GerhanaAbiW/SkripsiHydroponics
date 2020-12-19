import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:hydroponics/core/Services/HydroOrderService.dart';

class HydroOrderProvider with ChangeNotifier {
  List<HydroOrderModel> _adminOrders = [];
  double _revenue = 0;
  int _sales = 0;
  HydroOrderServices _hydroOrderServices = HydroOrderServices();

  List<HydroOrderModel> get adminOrders => _adminOrders;
  List<HydroOrderModel> _buyers = [];

  double get revenue => _revenue;

  HydroOrderProvider.initialize() {
    _getAdminListOrders();
    _getListBuyers();

  }

  void _getAdminListOrders() async {
    _adminOrders = await _hydroOrderServices.getAdminOrders();
    notifyListeners();
  }
  getAdminListOrders() async {
    _adminOrders = await _hydroOrderServices.getAdminOrders();
    notifyListeners();
  }
  void _getListBuyers() async {
    _buyers = await _hydroOrderServices.getBuyers();

    for (int i = 0; i < _buyers.length; i++) {
      _revenue += _buyers[i].totalPrice;
    }

    notifyListeners();
  }

  int get sales => _sales;

  List<HydroOrderModel> get buyers => _buyers;
}
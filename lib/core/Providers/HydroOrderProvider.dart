import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:hydroponics/core/Services/HydroOrderService.dart';

class HydroOrderProvider with ChangeNotifier {
  List<HydroOrderModel> _adminOrders = [];
  HydroOrderServices _hydroOrderServices = HydroOrderServices();
  List<HydroOrderModel> get adminOrders => _adminOrders;
  HydroOrderProvider.initialize() {
    _getAdminListOrders();

  }
  void _getAdminListOrders() async {
    _adminOrders = await _hydroOrderServices.getAdminOrders();
    notifyListeners();
  }
}
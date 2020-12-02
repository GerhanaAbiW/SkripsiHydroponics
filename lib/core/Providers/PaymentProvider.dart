import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Payment.dart';
import 'package:hydroponics/core/Services/PaymentService.dart';

class PaymentProvider with ChangeNotifier {
  List<PaymentModel> _adminPayments = [];
  PaymentServices _paymentServices = PaymentServices();

  PaymentProvider.initialize() {
    _getListAdminPayments();
  }

  List<PaymentModel> get adminPayments => _adminPayments;

//  methods
  void _getListAdminPayments() async {
    _adminPayments = await _paymentServices.getAdminPayments();
    notifyListeners();
  }

}
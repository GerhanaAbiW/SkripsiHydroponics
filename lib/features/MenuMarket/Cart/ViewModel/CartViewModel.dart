import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier{
  List<int> totals=[];
  int allTotal=0;
  void getTotals(){
    for(int i=0; i<totals.length; i++){
      allTotal = totals[i] + totals[i+1];
    }
    notifyListeners();
  }
}
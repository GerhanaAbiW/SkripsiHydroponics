import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Plants.dart';
import 'package:hydroponics/core/Services/PlantService.dart';


class PlantProvider with ChangeNotifier {
  List<Plants> _plants = [];
  PlantService _plantService = PlantService();

  PlantProvider.initialize() {
    _getListPlants();
  }

//  getter
  List<Plants> get plants => _plants;

//  methods
  void _getListPlants() async {
    _plants = await _plantService.getListPlants();
    notifyListeners();
  }


}

import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:hydroponics/core/Services/PlantService.dart';


class PlantProvider with ChangeNotifier {
  List<Plants> _plants = [];
  List<Plants> _plantsSearched = [];
  PlantService _plantService = PlantService();

  PlantProvider.initialize() {
    _getListPlants();
  }

//  getter
  List<Plants> get plants => _plants;
  List<Plants> get plantsSearched => _plantsSearched;

//  methods
  void _getListPlants() async {
    _plants = await _plantService.getListPlants();
    notifyListeners();
  }

  Future search({String plant})async{
    _plantsSearched = await _plantService.searchPlants(plant: plant);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${_plantsSearched.length}");
    notifyListeners();
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydroponics/core/Models/Plant.dart';
import 'package:uuid/uuid.dart';

class PlantService {
  Firestore _firestore = Firestore.instance;
  String collection = 'plants';

  void uploadPlant(Map<String, dynamic> data) {
    var id = Uuid();
    String plantId = id.v1();
    data["id"] = plantId;
    _firestore.collection(collection).document(plantId).setData(data);
  }



  Future<List<Plants>> getListPlants() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Plants> listPlants = [];
        for (DocumentSnapshot plant in result.documents) {
          listPlants.add(Plants.fromSnapshot(plant));
        }
        return listPlants;
      });

  void editPlant(Map<String, dynamic> data) {
    var id = Uuid();
    String plantId = id.v1();
    data["id"] = plantId;
    _firestore.collection(collection).document(plantId).updateData(data);
  }
}

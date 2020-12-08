

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
    data["createdAt"] = FieldValue.serverTimestamp();
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

  void editPlant(Map<String, dynamic> data, String plantId) {
    _firestore.collection(collection).document(plantId).updateData(data);
  }
  void deletePlant(String plantId) {
    _firestore.collection(collection).document(plantId).delete();
  }
  Future<List<Plants>> searchPlants({String plant}) {
    // code to convert the first character to uppercase
    //String searchKey = productName[0].toUpperCase() + productName.substring(1);
    String searchKey = plant[0].toLowerCase() + plant.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("Plant")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
      List<Plants> plants = [];
      for (DocumentSnapshot product in result.documents) {
        plants.add(Plants.fromSnapshot(product));
      }

      return plants;

    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Plants {
  static const ID = "id";
  static const PLANT = "Plant";
  static const MEDIA = "Media";
  static const IMAGE = "Image";
  static const PPM = "PPM";
  static const PH = "PH";
  static const FertilizerType = "FertilizerType";
  static const TimeOfFertilizer = "TimeOfFertilizer";
  static const DosageOfFertilizer = "DosageOfFertilizer";
  static const HarvestTime = "HarvestTime";
  static const PestsType = "PestType";
  static const SeedTime = "SeedingTime";
  static const HarvestDay = "HarvestDay";
  static const CreatedAt = "CreatedAt";



  String _id;
  String _plant;
  String _media;
  String _ppm;
  String _ph;
  String _image;
  String _seedingTime;
  String _fertilizerType;
  String _timeOfFertilizer;
  String _dosageFertilizer;
  String _harvestTime;
  int _harvestDay;
  String _pestsType;
  String _createdAt;

//  getters
  String get id => _id;
  String get plant => _plant;
  String get image => _image;
  String get media => _media;
  String get seedingTime => _seedingTime;
  String get ppm => _ppm;
  String get ph => _ph;
  String get fertilizerType => _fertilizerType;
  String get timeOfFertilizer => _timeOfFertilizer;
  String get dosageFertilizer => _dosageFertilizer;
  String get harvestTime => _harvestTime;

  int get harvestDay => _harvestDay;
  String get pestsType => _pestsType;
  String get createdAt => _createdAt;


//  named constructure
  Plants.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _id = data[ID];
    _plant = data[PLANT];
    _media = data[MEDIA];
    _image = data[IMAGE];
    _ph = data[PH];
    _ppm = data[PPM];
    _dosageFertilizer = data[_dosageFertilizer];
    _fertilizerType = data[FertilizerType];
    _timeOfFertilizer = data[TimeOfFertilizer];
    _harvestTime = data[HarvestTime];
    _harvestDay = data[HarvestDay];
    _seedingTime = data[SeedTime];
    _pestsType = data[PestsType];
    _createdAt = data[CreatedAt];

  }
}

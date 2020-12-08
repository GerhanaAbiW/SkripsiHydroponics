class MyPlantsModel {
  static const ID = "id";
  static const PlantID = "PlantId";
  static const PLANT = "Plant";
  static const MEDIA = "Media";
  static const SeedTime = "SeedingTime";
  static const IMAGE = "Image";
  static const PPM = "PPM";
  static const PH = "PH";
  static const FertilizerType = "FertilizerType";
  static const TimeOfFertilizer = "TimeOfFertilizer";
  static const DosageOfFertilizer = "DosageOfFertilizer";
  static const HarvestTime = "HarvestTime";
  static const HarvestDay = "HarvestDay";
  static const PestsType = "PestType";
  static const DATE = "Date";


  String _id;
  String _plantId;
  String _plant;
  String _media;
  String _seedingTime;
  String _ppm;
  String _ph;
  String _image;
  String _fertilizerType;
  String _timeOfFertilizer;
  String _dosageFertilizer;
  String _harvestTime;
  String _harvestDay;
  String _pestsType;
  String _date;


//  getters
  String get id => _id;

  String get plantId => _plantId;

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

  String get harvestDay => _harvestDay;

  String get pestsType => _pestsType;

  String get date => _date;


  MyPlantsModel.fromMap(Map data){
    _id = data[ID];
    _plantId = data[PlantID];
    _plant =  data[PLANT];
    _image =  data[IMAGE];
    _media = data[MEDIA];
    _seedingTime=data[SeedTime];
    _dosageFertilizer = data[DosageOfFertilizer];
    _harvestTime = data[HarvestTime];
    _harvestDay = data[HarvestDay];
    _ph = data[PH];
    _ppm = data[PPM];
    _pestsType = data[PestsType];
    _fertilizerType = data[FertilizerType];
    _timeOfFertilizer = data[TimeOfFertilizer];
    _date = data[DATE];


  }

  Map toMap() => {
    ID: _id,
    PlantID : _plantId,
    IMAGE: _image,
    DosageOfFertilizer: _dosageFertilizer,
    PLANT: _plant,
    PH: _ph,
    PPM: _ppm,
    PestsType: _pestsType,
    HarvestTime: _harvestTime,
    HarvestDay: _harvestDay,
    MEDIA:_media,
    SeedTime:_seedingTime,
    FertilizerType: _fertilizerType,
    TimeOfFertilizer : _timeOfFertilizer,
    DATE:_date



  };
}

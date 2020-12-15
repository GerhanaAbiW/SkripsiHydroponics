

class MyPlantsRecordModel{
  static const ID = "id";
  static const PlantID = "PlantId";
  static const PLANT = "Plant";
  static const MEDIA = "Media";
  static const IMAGE = "Image";
  static const PPM = "PPM";
  static const PH = "PH";
  static const FertilizerType = "FertilizerType";
  static const TimeOfFertilizer = "TimeOfFertilizer";
  static const DosageOfFertilizer = "DosageOfFertilizer";
  static const HarvestTime = "HarvestTime";
  static const SeedingTime = "SeedingTime";
  static const PestsType = "PestType";
  static const RecordMedia = "RecordMedia";
  static const RecordPPM = "RecordPPM";
  static const RecordPH = "RecordPH";
  static const RecordFertilizerType = "RecordFertilizerType";
  static const RecordTimeOfFertilizer = "RecordTimeOfFertilizer";
  static const RecordDosageFertilizer = "RecordDosageFertilizer";
  static const RecordHarvestTime = "RecordHarvestTime";
  static const RecordPestsType = "RecordPestsType";
  static const DATE = "Date";

  String _id;
  String _plantId;
  String _plant;
  String _media;
  String _ppm;
  String _ph;
  String _image;
  String _fertilizerType;
  String _timeOfFertilizer;
  String _dosageFertilizer;
  String _harvestTime;
  String _pestsType;
  String _date;
  String _seedingTime;


  bool _recordMedia;
  bool _recordPPM;
  bool _recordPH;
  bool _recordFertilizerType;
  bool _recordTimeOfFertilizer;
  bool _recordDosageFertilizer;
  bool _recordHarvestTime;
  bool _recordPestsType;




//  getters
  String get id => _id;
  String get seedingTime => _seedingTime;

  String get plantId => _plantId;

  String get plant => _plant;

  String get image => _image;

  String get media => _media;

  String get ppm => _ppm;

  String get ph => _ph;

  String get fertilizerType => _fertilizerType;

  String get timeOfFertilizer => _timeOfFertilizer;

  String get dosageFertilizer => _dosageFertilizer;

  String get harvestTime => _harvestTime;

  String get pestsType => _pestsType;

  String get date => _date;

  bool get recordPPM => _recordPPM;

  bool get recordPH => _recordPH;

  bool get recordFertilizerType => _recordFertilizerType;

  bool get recordTimeOfFertilizer => _recordTimeOfFertilizer;

  bool get recordDosageFertilizer => _recordDosageFertilizer;

  bool get recordHarvestTime => _recordHarvestTime;

  bool get recordPestsType => _recordPestsType;

  bool get recordMedia => _recordMedia;





  MyPlantsRecordModel.fromMap(Map data){
    _id = data[ID];
    _plantId = data[PlantID];
    _plant =  data[PLANT];
    _image =  data[IMAGE];
    _media = data[MEDIA];
    _dosageFertilizer = data[DosageOfFertilizer];
    _harvestTime = data[HarvestTime];
    _ph = data[PH];
    _ppm = data[PPM];
    _pestsType = data[PestsType];
    _fertilizerType = data[FertilizerType];
    _timeOfFertilizer = data[TimeOfFertilizer];
    _recordMedia = data[RecordMedia];
    _recordPPM=data[RecordPPM];
    _recordPH=data[RecordPH];
    _recordFertilizerType=data[RecordFertilizerType];
    _recordTimeOfFertilizer=data[RecordTimeOfFertilizer];
    _recordDosageFertilizer=data[RecordDosageFertilizer];
    _recordHarvestTime=data[RecordHarvestTime];
    _recordPestsType=data[RecordPestsType];
    _date = data[DATE];
    _seedingTime=data[SeedingTime];

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
    MEDIA:_media,
    FertilizerType: _fertilizerType,
    TimeOfFertilizer : _timeOfFertilizer,
    RecordPPM : _recordPPM,

    RecordPH :_recordPH,

    RecordFertilizerType : _recordFertilizerType,

    RecordTimeOfFertilizer : _recordTimeOfFertilizer,

    RecordDosageFertilizer : _recordDosageFertilizer,

    RecordHarvestTime : _recordHarvestTime,

    RecordPestsType : _recordPestsType,

    RecordMedia :  _recordMedia,
    SeedingTime : _seedingTime,
    DATE:_date

  };


}
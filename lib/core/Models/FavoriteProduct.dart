class FavoriteProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRODUCT_ID = "productId";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const PICTURE = "picture";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const BRAND = "brand";
  static const RATING = "rating";
  static const FAVORITE = "favorite";
  static const DATE = "date";



  String _id;
  String _name;
  List _picture;
  String _description;
  String _category;
  String _brand;
  int _quantity;
  int _price;
  int _rating;
  String _date;
  String _productId;
  bool _favorite;



  String get id => _id;

  String get name => _name;

  List get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  int get price => _price;

  int get rating => _rating;
  String get date => _date;
  bool get favorite => _favorite;



  //  getters



  String get productId => _productId;



  FavoriteProductModel.fromMap(Map data){
    _id = data[ID];
    _name =  data[NAME];
    _picture =  data[PICTURE];
    _productId = data[PRODUCT_ID];
    _quantity = data[QUANTITY];
    _price = data[PRICE];
    _description = data[DESCRIPTION];
    _brand = data[BRAND];
    _category = data[CATEGORY];
    _rating = data[RATING];
    _date = data[DATE];
    _favorite = data[FAVORITE];
  }

  Map toMap() => {
    ID: _id,
    PICTURE: _picture,
    QUANTITY: _quantity,
    NAME: _name,
    PRODUCT_ID: _productId,
    PRICE: _price,
    RATING: _rating,
    CATEGORY: _category,
    BRAND: _brand,
    DESCRIPTION:_description,
    DATE: _date,
    FAVORITE: _favorite
  };
}
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
//  CategoryService _categoryService = CategoryService();
//  BrandService _brandService = BrandService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();

//  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
//  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  List<String> selectedSizes = <String>[];
  File _image1;
  File _image2;
  File _image3;

//
//  @override
//  void initState() {
//    _getCategories();
//    _getBrands();
//  }

//  List<DropdownMenuItem<String>> getCategoriesDropdown(){
//    List<DropdownMenuItem<String>> items = new List();
//    for(int i = 0; i < categories.length; i++){
//      setState(() {
//        items.insert(0, DropdownMenuItem(child: Text(categories[i].data['category']),
//            value: categories[i].data['category']));
//      });
//    }
//    return items;
//  }
//
//  List<DropdownMenuItem<String>> getBrandosDropDown(){
//    List<DropdownMenuItem<String>> items = new List();
//    for(int i = 0; i < brands.length; i++){
//      setState(() {
//        items.insert(0, DropdownMenuItem(child: Text(brands[i].data['brand']),
//            value: brands[i].data['brand']));
//      });
//    }
//    return items;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: grey,
        leading: Icon(
          Icons.close,
          color: black,
        ),
        title: Text(
          "add product",
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                1);
                          },
                          child: _displayChild1()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                2);
                          },
                          child: _displayChild2()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                        borderSide: BorderSide(
                            color: grey.withOpacity(0.5), width: 2.5),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              3);
                        },
                        child: _displayChild3(),
                      ),
                    ),
                  ),
                ],
              ),



              ProductName(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Text(
                  'enter a product name with 10 characters at maximum',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: red, fontSize: 12),
                ),
              ),

              Quantity(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Text(
                  'you must enter a product quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: red, fontSize: 12),
                ),
              ),


              Price(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Text(
                  'you must enter a product price',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: red, fontSize: 12),
                ),
              ),


//              select category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Category: ',
                      style: TextStyle(color: red),
                    ),
                  ),
                  DropdownButton(
                    items: categoriesDropDown,
                    onChanged: changeSelectedCategory,
                    value: _currentCategory,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Brand: ',
                      style: TextStyle(color: red),
                    ),
                  ),
                  DropdownButton(
                    items: brandsDropDown,
                    onChanged: changeSelectedBrand,
                    value: _currentBrand,
                  ),
                ],
              ),

              Description(),

              Text('Available Sizes'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: selectedSizes.contains('S'),
                      onChanged: (value) => changeSelectedSize('S')),
                  Text('S'),
                  Checkbox(
                      value: selectedSizes.contains('M'),
                      onChanged: (value) => changeSelectedSize('M')),
                  Text('M'),
                  Checkbox(
                      value: selectedSizes.contains('L'),
                      onChanged: (value) => changeSelectedSize('L')),
                  Text('L'),
                  Checkbox(
                      value: selectedSizes.contains('XL'),
                      onChanged: (value) => changeSelectedSize('XL')),
                  Text('XL'),
                ],
              ),
              AddBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget ProductName() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
        child: Container(
          //color: Colors.white,
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.white,
            //elevation: 0.0,
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
              controller: productNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Input Your Product Name",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  border: InputBorder.none),
              validator: (value) {
                if (value.isEmpty) {
                  return 'You must enter the product name';
                } else if (value.length > 10) {
                  return 'Product name cant have more than 10 letters';
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Quantity() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
        child: Container(
          //color: Colors.white,
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.white,
            //elevation: 0.0,
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
              controller: quatityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Input Your Product Quantity",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  border: InputBorder.none),
              validator: (value) {
                if (value.isEmpty) {
                  return 'You must enter the product name';
                } else if (value.length > 10) {
                  return 'Product name cant have more than 10 letters';
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Price() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
        child: Container(
          //color: Colors.white,
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.white,
            //elevation: 0.0,
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
              controller: quatityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Input Your Product Price",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  border: InputBorder.none),
              validator: (value) {
                if (value.isEmpty) {
                  return 'You must enter the product name';
                } else if (value.length > 10) {
                  return 'Product name cant have more than 10 letters';
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Description() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 15, 24.0, 20),
        child: Container(
          //color: Colors.white,
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.white,
            //elevation: 0.0,
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
              //controller: _description,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }

  Widget AddBtn() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
              colors: [Colors.red, Colors.deepOrange],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              validateAndUpload();
            },
            child: Text(
              "Add Product",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }

//  _getCategories() async{
//    List<DocumentSnapshot> data = await _categoryService.getCategories();
//    print(data.length);
//    setState(() {
//      categories = data;
//      categoriesDropDown = getCategoriesDropdown();
//      _currentCategory = categories[0].data['category'];
//    });
//  }
//
//  _getBrands() async{
//    List<DocumentSnapshot> data = await _brandService.getBrands();
//    print(data.length);
//    setState(() {
//      brands = data;
//      brandsDropDown = getBrandosDropDown();
//      _currentBrand = brands[0].data['brand'];
//    });
//  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() {
    if (_formKey.currentState.validate()) {
      if (_image1 != null && _image2 != null && _image3 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl;
          final String picture =
              "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
//            StorageUploadTask task = storage.ref
        } else {
          Fluttertoast.showToast(msg: 'select atleast one size');
        }
      } else {
        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}


import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/MenuAdmin/AppTools.dart';
import 'package:hydroponics/features/MenuAdmin/MainMenuAdmin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  CategoryServices _categoryService = CategoryServices();
  BrandServices _brandService = BrandServices();
  ProductServices productService = ProductServices();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  TextEditingController prodcutDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  //List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  //List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<String> brands = ['A', 'B', 'C', 'D'];
  List<String> categories = ['Bibit', 'Obat', 'Pupuk', 'Alat'];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  List<File> imageList;
  List<File> tempImageList;

  bool isLoading = false;
  @override
  void initState() {
//    _getCategories();
    _getCategories();
    _getBrands();
//    _getBrands();
  }

//  List<DropdownMenuItem<String>> getCategoriesDropdown() {
//    List<DropdownMenuItem<String>> items = new List();
//    for (int i = 0; i < categories.length; i++) {
//      setState(() {
//        items.insert(
//            0,
//            DropdownMenuItem(
//                child: Text(categories[i].data['category']),
//                value: categories[i].data['category']));
//      });
//    }
//    return items;
//  }
  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        items.insert(0,
            DropdownMenuItem(child: Text(categories[i]), value: categories[i]));
      });
    }
    return items;
  }

//
//  List<DropdownMenuItem<String>> getBrandsDropDown() {
//    List<DropdownMenuItem<String>> items = new List();
//    for (int i = 0; i < brands.length; i++) {
//      setState(() {
//        items.insert(
//            0,
//            DropdownMenuItem(
//                child: Text(brands[i].data['brand']),
//                value: brands[i].data['brand']));
//      });
//    }
//    return items;
//  }
  List<DropdownMenuItem<String>> getBrandsDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < brands.length; i++) {
      setState(() {
        items.insert(
            0, DropdownMenuItem(child: Text(brands[i]), value: brands[i]));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return  new SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton.icon(
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(15.0))),
                    onPressed: () => pickImage(),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: new Text(
                      "Add Images",
                      style: new TextStyle(color: Colors.white),
                    )),
              ),
              new SizedBox(
                height: 10.0,
              ),
              MultiImagePickerList(
                  imageList: imageList,
                  removeNewImage: (index) {
                    removeImage(index);
                  }),
              new SizedBox(
                height: 10.0,
              ),
              productTextField(
                  textTitle: "Product Title",
                  textHint: "Enter Product Title",
                  controller: productNameController),
              new SizedBox(
                height: 10.0,
              ),
              productTextField(
                  textTitle: "Product Price",
                  textHint: "Enter Product Price",
                  textType: TextInputType.number,
                  controller: productPriceController),
              new SizedBox(
                height: 10.0,
              ),
              productTextField(
                  textTitle: "Product Description",
                  textHint: "Enter Description",
                  controller: prodcutDescriptionController,
                  height: 180.0),
              new SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  productTextField(
                      textTitle: "Product Quantity",
                      textHint: "Enter Product Quantity",
                      textType: TextInputType.number,
                      controller: quatityController),
                  productDropDown(
                      textTitle: "Product Category",
                      hintText: "Please choose the category",
                      selectedItem: _currentCategory,
                      dropDownItems: categoriesDropDown,
                      changedDropDownItems: changeSelectedCategory),
                  productDropDown(
                      textTitle: "Product Brand",
                      hintText: "Please choose the brand",
                      selectedItem: _currentBrand,
                      dropDownItems: brandsDropDown,
                      changedDropDownItems: changeSelectedBrand),
                ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              appButton(
                    btnTxt: "Add Product",
                  onBtnclicked: addNewProducts,
                  btnPadding: 20.0,
                  btnColor: Colors.white),
            ],
          ),
        ),

    );
  }

//  _getCategories() async {
//    List<DocumentSnapshot> data = await _categoryService.getCategories();
//    print(data.length);
//    setState(() {
//      categories = data;
//      categoriesDropDown = getCategoriesDropdown();
//      _currentCategory = categories[0].data['category'];
//    });
//  }
  _getCategories() {
    //List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(categories.length);
    setState(() {
      categoriesDropDown = getCategoriesDropdown();
      //_currentCategory = categories[0];
    });
  }

//
//  _getBrands() async {
//    List<DocumentSnapshot> data = await _brandService.getBrands();
//    print(data.length);
//    setState(() {
//      brands = data;
//      brandsDropDown = getBrandsDropDown();
//      _currentBrand = brands[0].data['brand'];
//    });
//  }
  _getBrands() async {
    //List<DocumentSnapshot> data = await _brandService.getBrands();
    print(brands.length);
    setState(() {
      //brands = data;
      brandsDropDown = getBrandsDropDown();
      //_currentBrand = brands[0];
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentBrand = selectedBrand);
  }



  validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (imageList != null) {
        if (productNameController.text != "") {
          List<String> imageUrlList = [];

          for(int i=0; i<imageList.length; i++){
            String rannum = Uuid().v1();
            final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
            StorageReference reference = FirebaseStorage.instance.ref().child(picture).child(rannum);
            StorageUploadTask uploadTask = reference.putFile(imageList[i]);
            StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
            String _url = await downloadUrl.ref.getDownloadURL();
            imageUrlList.add(_url);
          }

          productService.uploadProduct({
            "name": productNameController.text,
            "price": double.parse(productPriceController.text),
            "picture": imageUrlList,
            "description": prodcutDescriptionController.text,
            "rating": 1,
            "quantity": int.parse(quatityController.text),
            "brand": _currentBrand,
            "category": _currentCategory,
          });

          _formKey.currentState.reset();
          setState(() => isLoading = false);
          changeScreen(context, MenuAdmin());
          //Navigator.pop(context);
          //        });

        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);
//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }

  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    File file = File(pickedFile.path);
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (tempImageList == null) {
        tempImageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
//          if (imageFile.length <= 2) {
//            s++;
//            tempImageList.add(file);
//          }else if(imageFile.length > 2){
//            showSnackBar("Product Images cannot be empty", scaffoldKey);
//          }
          tempImageList.add(file);
        }
      }
      setState(() {
        imageList = tempImageList;
      });
    }
  }

  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }

  addNewProducts() {
    if (imageList == null || imageList.isEmpty) {
      showSnackBar("Product Images cannot be empty", scaffoldKey);
      return;
    }
    if (productNameController.text == "") {
      showSnackBar("Product Title cannot be empty", scaffoldKey);
      return;
    }
    if (productPriceController.text == "") {
      showSnackBar("Product Price cannot be empty", scaffoldKey);
      return;
    }
    if (productNameController.text == "") {
      showSnackBar("Product Description cannot be empty", scaffoldKey);
      return;
    }
    if (_currentBrand == "Select Product category") {
      showSnackBar("Please select a category", scaffoldKey);
      return;
    }
    if (_currentCategory == "Select Product category") {
      showSnackBar("Please select a category", scaffoldKey);
      return;
    } else
      validateAndUpload();
  }
}

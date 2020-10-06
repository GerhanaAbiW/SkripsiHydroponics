import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/MenuAdmin/AppTools.dart';
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
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        title: new Text("Add Products"),
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
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
          )
        ],
      ),
      body: new SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  btnColor: green),
            ],
          ),
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

//  void _selectImage(Future<File> pickImage) async {
//    File tempImg = await pickImage;
//    setState(() => _image1 = tempImg);
//  }

//  Future<List<String>> uploadFiles(List _images) async {
//    var imageUrls = await Future.wait(_images.map((_image) => uploadFile(_image)));
//    print(imageUrls);
//    return imageUrls;
//  }
  uploadImage(List<File> _imageFile) async {
    List<String> _urllist = [];
    // ignore: await_onl_futures
    await _imageFile.forEach((image) async {
      String rannum = Uuid().v1();
      final String picture =
          "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      StorageReference reference =
          FirebaseStorage.instance.ref().child(picture).child(rannum);
      StorageUploadTask uploadTask = reference.putFile(image);
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      String _url = await downloadUrl.ref.getDownloadURL();
      print('URL KITA SEMUA $_url');
      _urllist.add(_url);
      print("bajinagan$_urllist");
    });
    return _urllist;
  }

  validateAndUpload() async {
    List<String> urlURL = await uploadImage(imageList);

    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      // if (imageList != null) {
      if (productNameController.text != "") {
        List<String> imageUrlList = urlURL;
        print('image $imageUrlList');
        print('image URL $imageUrlList');
//          await _imageFile.forEach((image) async{
//            String rannum = Uuid().v1();
//            final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
//            StorageReference reference = FirebaseStorage.instance.ref().child(picture).child(rannum);
//            StorageUploadTask uploadTask = reference.putFile(image);
//            StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
//            String _url = await downloadUrl.ref.getDownloadURL();
//            imageUrlList.add(_url);
//          });
//          final FirebaseStorage storage = FirebaseStorage.instance;
//          final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
//          StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image1);
//          StorageTaskSnapshot snapshot1 = await task1.onComplete.then((snapshot) => snapshot);

//
//          task1.onComplete.then((snapshot3) async {
//            imageUrl1 = await snapshot1.ref.getDownloadURL();
        productService.uploadProduct({
          "name": productNameController.text,
          "price": double.parse(productPriceController.text),
          "picture": imageUrlList,
          "description": prodcutDescriptionController.text,
          //"rating": 1,
          "quantity": int.parse(quatityController.text),
          "brand": _currentBrand,
          "category": _currentCategory,
        });
        _formKey.currentState.reset();
        setState(() => isLoading = false);
        Navigator.pop(context);
        //        });

      } else {
        setState(() => isLoading = false);
      }
      // }
//      else {
//         setState(() => isLoading = false);
// //        Fluttertoast.showToast(msg: 'all the images must be provided');
//       }
    }
  }

  pickImage() async {
    List<File> tempImageList;
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
          if (imageFile.length == 2) {
            tempImageList.add(file);
          } else {
            showSnackBar("Product Images cannot be empty", scaffoldKey);
          }
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

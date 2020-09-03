import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/MenuAdmin/AppTools.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductServices productService = ProductServices();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  TextEditingController prodcutDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
  <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;

  File _image1;
  bool isLoading = false;

  @override
  void initState() {
    _getCategories();
    _getBrands();
  }

  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(categories[i].data['category']),
                value: categories[i].data['category']));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandosDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < brands.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(brands[i].data['brand']),
                value: brands[i].data['brand']));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                productDropDown(
                    textTitle: "Product Category",
                    selectedItem: _currentCategory,
                    dropDownItems: categoriesDropDown,
                    changedDropDownItems: changeSelectedCategory),
                productDropDown(
                    textTitle: "Product Brand",
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
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropdown();
      _currentCategory = categories[0].data['category'];
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      brands = data;
      brandsDropDown = getBrandosDropDown();
      _currentBrand = brands[0].data['brand'];
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentBrand = selectedBrand);
  }



  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => _image1 = tempImg);
  }





  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image1 != null) {
        if (productNameController.text != "") {
          String imageUrl1;
          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image1);
          StorageTaskSnapshot snapshot1 = await task1.onComplete.then((snapshot) => snapshot);


          task1.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();

            productService.uploadProduct({
              "name":productNameController.text,
              "price":double.parse(productPriceController.text),
              "picture":imageUrl1,
              "quantity":int.parse(quatityController.text),
              "brand":_currentBrand,
              "category":_currentCategory,
            });
            _formKey.currentState.reset();
            setState(() => isLoading = false);
            Navigator.pop(context);
          });
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }




  List<File> imageList;

  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    File file = File(pickedFile.path);
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
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
    }

  }
}
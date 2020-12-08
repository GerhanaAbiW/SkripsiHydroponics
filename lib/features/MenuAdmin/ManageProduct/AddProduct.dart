import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';
import 'package:hydroponics/core/Services/ProductServices.dart';
import 'package:hydroponics/features/MenuAdmin/MainMenuAdmin.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/AdminOrderDetails.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  CategoryServices _categoryService = CategoryServices();
  BrandServices _brandService = BrandServices();
  bool favorite = false;
  ProductServices productService = ProductServices();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  TextEditingController prodcutDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  List<String> brands = ['A', 'B', 'C', 'D'];
  final List<Map<String, dynamic>> brandItems = [
    {
      'value': 'A',
      'label': 'A',
    },
    {
      'value': 'B',
      'label': 'B',
    },
    {
      'value': 'C',
      'label': 'C',
    },
    {
      'value': 'D',
      'label': 'D',
    },
  ];
  final List<Map<String, dynamic>> categoryItems = [
    {
      'value': 'Alat',
      'label': 'Alat',
    },
    {
      'value': 'Bibit',
      'label': 'Bibit',
    },
    {
      'value': 'Pupuk',
      'label': 'Pupuk',
    },
    {
      'value': 'Obat',
      'label': 'Obat',
    },
  ];
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
    _getCategories();
    _getBrands();
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenTosca,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Add Product",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
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
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    FormTextField(
                        textLabel: "Product Title",
                        textHint: "Enter Product Title",
                        controller: productNameController),
                    SizedBox(
                      height: 16,
                    ),
                    FormTextField(
                        textLabel: "Product Price",
                        textHint: "Enter Product Price",
                        textType: TextInputType.number,
                        controller: productPriceController),
                    SizedBox(
                      height: 16,
                    ),
                    FormTextField(
                        textLabel: "Product Description",
                        textHint: "Enter Description",
                        controller: prodcutDescriptionController,
                        height: 180.0),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormTextField(
                            textLabel: "Product Quantity",
                            textHint: "Enter Product Quantity",
                            textType: TextInputType.number,
                            controller: quatityController),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownForm(
                            textLabel: "Product Category",
                            textHint: "Please choose the category",
                            selectedItem: _currentCategory,
                            dropDownItems: categoryItems,
                            changedDropDownItems: changeSelectedCategory),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownForm(
                            textLabel: "Product Brand",
                            textHint: "Please choose the brand",
                            selectedItem: _currentBrand,
                            dropDownItems: brandItems,
                            changedDropDownItems: changeSelectedBrand),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              appButton(
                  btnTxt: "Add Product",
                  onBtnclicked: addNewProducts,
                  btnPadding: 20.0,
                  btnColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  _getCategories() {
    //List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(categories.length);
    setState(() {
      categoriesDropDown = getCategoriesDropdown();
    });
  }

  _getBrands() async {
    print(brands.length);
    setState(() {
      brandsDropDown = getBrandsDropDown();
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

          for (int i = 0; i < imageList.length; i++) {
            String rannum = Uuid().v1();
            final String picture =
                "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
            StorageReference reference =
                FirebaseStorage.instance.ref().child("Products").child(picture).child(rannum);
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
            // "favorite": favorite
          });

          _formKey.currentState.reset();
          setState(() => isLoading = false);
          changeScreen(context, MenuAdmin());
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);
      }
    }
  }

  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    File file = File(pickedFile.path);
    if (file != null) {
      List<File> imageFile = new List();
      imageFile.add(file);

      if (tempImageList == null) {
        tempImageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          tempImageList.add(file);
        }
      }
      setState(() {
        imageList = tempImageList;
      });
    }
  }

  removeImage(int index) async {
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

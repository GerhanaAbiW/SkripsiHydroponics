import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Category.dart';
import 'package:hydroponics/core/Providers/CategoryProvider.dart';
import 'package:hydroponics/core/Services/CategoryServices.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  CategoryServices _categoryService = CategoryServices();
  CategoryModel categoryModel;

  //const AddCategory({Key key, this.categoryModel}) : super(key: key);
  final List<String> myList = [
    'images/plant.png',
    'images/plant.png',
    'images/plant.png',
    'images/plant.png',
    'images/plant.png',
  ];
  final List<String> names = ['ichigo', 'niigo', 'sango', 'yongo', 'hakko'];
  final List<String> phones = [
    '(021)678392',
    '(021)678334',
    '(021)672414',
    '(021)678390',
    '(021)679992'
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.loadCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: <Widget>[
          Center(
            child: Text(
              'Add Category',
              style: TextStyle(color: green),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: green,
            ),
            onPressed: () {
              _categoryAlert();
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: ListView.builder(
          itemCount: categoryProvider.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              child: ListTile(
//                leading: CircleAvatar(
//                  radius: 30,
//                  backgroundImage: ExactAssetImage(categoryModel.image[index]),
//                ),
                title: Text(categoryModel.category[index], style: TextStyle(fontSize: 14)),
                subtitle: Text(phones[index], style: TextStyle(fontSize: 10)),
                trailing: Icon(Icons.tag_faces),
              ),
            );
          },
        ),
      ),
    );
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value.isEmpty) {
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(hintText: "add category"),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (categoryController.text != null) {
                _categoryService.createCategory(categoryController.text);
              }
//          Fluttertoast.showToast(msg: 'category created');
              Navigator.pop(context);
            },
            child: Text('ADD')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}

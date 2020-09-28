import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Brand.dart';
import 'package:hydroponics/core/Providers/BrandProvider.dart';
import 'package:hydroponics/core/Services/BrandServices.dart';
import 'package:provider/provider.dart';


class AddBrand extends StatefulWidget {
  @override
  _AddBrandState createState() => _AddBrandState();
}

class _AddBrandState extends State<AddBrand> {
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  BrandServices _brandService = BrandServices();
  BrandModel brandModel;
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
    final brandProvider = Provider.of<BrandProvider>(context, listen: false);
    brandProvider.loadBrands();
    return Scaffold(
      appBar: AppBar(
        title: Text('Brand'),
        actions: <Widget>[
          Center(
            child: Text(
              'Add Brand',
              style: TextStyle(color: green),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: green,
            ),
            onPressed: () {
              _brandAlert();
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: ListView.builder(
          itemCount: brandProvider.brands.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              child: ListTile(
//                leading: CircleAvatar(
//                  radius: 30,
//                  backgroundImage: ExactAssetImage(myList[index]),
//                ),
                title: Text(brandModel.brand[index], style: TextStyle(fontSize: 14)),
                subtitle: Text(phones[index], style: TextStyle(fontSize: 10)),
                trailing: Icon(Icons.tag_faces),
              ),
            );
          },
        ),
      ),
    );
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add brand"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(brandController.text != null){
            _brandService.createBrand(brandController.text);
          }
//          Fluttertoast.showToast(msg: 'brand added');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}


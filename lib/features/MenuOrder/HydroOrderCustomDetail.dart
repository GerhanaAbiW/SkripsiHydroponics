import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:provider/provider.dart';

var blueOrder = Color(0xFF03A9F4);

class HydroOrderCustomDetail extends StatefulWidget {
  _HydroOrderCustomDetailState createState() => _HydroOrderCustomDetailState();
}

class _HydroOrderCustomDetailState extends State<HydroOrderCustomDetail> {
  @override
  List<DropdownMenuItem<String>> typelahanDropdown =
      <DropdownMenuItem<String>>[];
  List<String> lahanType = ['Vertical', 'Horizontal'];
  String _currentTipeLahan;

  void initState() {
    _getTipeLahan();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: blueOrder,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Order Custom Area',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: ListView(
          // child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Gambar Refrensi",
                style: new TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 300,
                        height: 300, //ScreenUtil().setWidth(88),
                        child: model.profileImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(2.0),
                                    topRight: const Radius.circular(2.0)
                                    //ScreenUtil().setWidth(44)
                                    ),
                                child: Image.memory(
                                  model.profileImage,
                                  fit: BoxFit.cover,
                                  height: 300, //ScreenUtil().setWidth(88),
                                ),
                              )
                            : model.imageUrl != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(2.0),
                                        topRight: const Radius.circular(2.0)),
                                    child: Image.network(
                                      model.imageUrl,
                                      fit: BoxFit.cover,
                                      height:
                                          // ScreenUtil().setWidth(88),
                                          300,
                                    ),
                                  )
                                : Image.asset(
                                    "images/no-image-icon-blue.png",
                                  ),
                      ),
//Container(width: 24, child: Icon(Icons.camera_alt))
                      // Image.asset('images/asset_profile/ic_about_us.png'),
                      // ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                print("Pressed");
                model.selectImage();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: productTextField(
                textTitle: "Luas Lahan",
                textHint: "Masukkan Luas Lahan",
                //controller: prodcutDescriptionController,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  productDropDown(
                      textTitle: "Tipe Lahan",
                      hintText: "Masukkan Type Lahan",
                      selectedItem: _currentTipeLahan,
                      dropDownItems: typelahanDropdown,
                      changedDropDownItems: changeSelectedCategory),
                ]),
            Container(
              child: productTextField(
                textTitle: "jumlah Lubang",
                textHint: "Masukkan Jumlah Lubang Tanaman",
                //controller: prodcutDescriptionController,
              ),
            ),
            Container(
              child: productTextField(
                textType: TextInputType.number,
                textTitle: "Nomor HP",
                textHint: "Masukkan Nomor HP Anda",
                //controller: prodcutDescriptionController,
              ),
            ),
            Container(
              child: productTextField(
                  textType: TextInputType.multiline,
                  textTitle: "Alamat",
                  textHint: "Masukkan Alamat Anda",
                  //controller: prodcutDescriptionController,
                  height: 180.0),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: blueOrder),
                  child: Text(
                    'ORDER',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      //)
    );
  }

  _getTipeLahan() {
    //List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(lahanType.length);
    setState(() {
      typelahanDropdown = getLahanDropdown();
      //_currentCategory = categories[0];
    });
  }

  changeSelectedCategory(String selectedTipeLahan) {
    setState(() => _currentTipeLahan = selectedTipeLahan);
  }

  List<DropdownMenuItem<String>> getLahanDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < lahanType.length; i++) {
      setState(() {
        items.insert(0,
            DropdownMenuItem(child: Text(lahanType[i]), value: lahanType[i]));
      });
    }
    return items;
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.grey));
}

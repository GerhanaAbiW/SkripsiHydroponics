import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:provider/provider.dart';

var greenTosca = GreenTosca;

class OrderDetails extends StatefulWidget {
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
          backgroundColor: greenTosca,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Order Detail',
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
            ),
            Center(
              //harusnya image network
              child: Image.asset(
                'images/hydro1.jpeg',
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width /
                    1, //MediaQuery.of(context).size.width / 1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hydro Type : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Luas Lahan : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tipe Lahan : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Jumlah Lubang : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nomor HP : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Alamat : -",
                      style: new TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ],
                ),
              ),
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
                      color: greenTosca),
                  child: Text(
                    'Accept Order',
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
    print(lahanType.length);
    setState(() {
      typelahanDropdown = getLahanDropdown();
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

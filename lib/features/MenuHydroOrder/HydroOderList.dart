import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuHydroOrder/DetailType.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOrderCustomDetail.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOrderDetail.dart';
import 'package:hydroponics/features/MenuHydroOrder/ViewModel/DetailType.dart';

var blueOrder = Color(0xFF03A9F4);

class HydroOrderList extends StatefulWidget {
  @override
  _HydroOrderListState createState() => _HydroOrderListState();
}

class _HydroOrderListState extends State<HydroOrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<HydroList> listSection = [
    HydroList("Small", "images/hydro2.jpeg", "10x20x30", "Rp 100.000",
        "2 - 4 tingkatan", "4 - 6 lubang", "Horizontal/Vertical"),
    HydroList("Medium", "images/bayam.jpeg", "10x50x30", "Rp 150.000",
        "2 - 4 tingkatan", "4 - 6 lubang","Horizontal/Vertical"),
    HydroList("Large", "images/bayam.jpeg", "10x20x90", "Rp 250.000",
        "2 - 4 tingkatan", "4 - 6 lubang","Horizontal/Vertical"),
    HydroList("Custom", "images/bayam.jpeg", "10x20x20", "> Rp 300.000",
        "2 - 4 tingkatan", "4 - 6 lubang","Horizontal/Vertical")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: blueOrder,
        elevation: 10,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydro Order',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8, right: 8, bottom: 10.0),
            child: Text(
              "Kamu Bisa Tentukan Set Starter Kit Untuk Tanaman Hidroponikmu!",
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.blueGrey, fontSize: 21),
            ),
          ),
          SizedBox(height: 16),
          CardListOrder(
            list: listSection,
          ),
        ],
      ),
    );
  }
}

class CardListOrder extends StatelessWidget {
  final List<HydroList> list;
  CardListOrder({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height / 6.5,
              child: Card(
                elevation: 20.0,
                child: GestureDetector(
                  onTap: () {
                    if (list[index].type == "Small" ||
                        list[index].type == "Medium" ||
                        list[index].type == "Large") {
                      changeScreen(
                          context,
                          HydroOrderDetail(
                              hydroType: types[index]
                          ));
                    } else {
                      changeScreen(context, HydroOrderCustomDetail(hydroType: types[index]));
                    }
                  },
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0), //or 15.0
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5.5,
                        width: MediaQuery.of(context).size.width / 5.5,
                        color: blueOrder,
                        child: Image(
                          image: AssetImage(
                            list[index].image,
                          ),
                          fit: BoxFit
                              .cover, //Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                        ),
                      ),
                    ),

                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].type,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(list[index].area,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blueAccent,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(list[index].price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontFamily: 'Montserrat',
                                      fontSize: 10)),
                            ),
                          ]),
                    ),


                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

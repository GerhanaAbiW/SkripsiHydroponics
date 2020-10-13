import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuOrder/OrderCustomArea.dart';
import 'package:hydroponics/features/MenuOrder/OrderLargeArea.dart';
import 'package:hydroponics/features/MenuOrder/OrderMediumArea.dart';
import 'package:hydroponics/features/MenuOrder/OrderSmallArea.dart';

var blueOrder = Color(0xFF03A9F4);

class HydroOrderList extends StatefulWidget {
  @override
  _HydroOrderListState createState() => _HydroOrderListState();
}

class _HydroOrderListState extends State<HydroOrderList> {
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
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydro Order',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
              "Berapa luas area yang kamu punya untuk tempat bercocok tanam?",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              )),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderSmallArea()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 7, //90,
              width: MediaQuery.of(context).size.width * 0.9,
              //alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(1, 1, 16, 1),
              //width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blueOrder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/hydro1.jpeg',
                      height: MediaQuery.of(context).size.height,
                      width: 100 //MediaQuery.of(context).size.width / 1,
                      ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Small Area",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Area max 200x160x130",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rp. 2000.000 - 5000.000000",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.navigate_next,
                            size: (30),
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderMediumArea()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 7, //90,
              width: MediaQuery.of(context).size.width * 0.9,
              //alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(1, 1, 16, 1),
              //width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blueOrder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/hydro1.jpeg',
                      height: MediaQuery.of(context).size.height,
                      width: 100 //MediaQuery.of(context).size.width / 1,
                      ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Medium Area",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Area max 200x160x130",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rp. 2000.000 - 5000.000000",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.navigate_next,
                            size: (30),
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderLargeArea()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 7, //90,
              width: MediaQuery.of(context).size.width * 0.9,
              //alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(1, 1, 16, 1),
              //width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blueOrder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/hydro1.jpeg',
                      height: MediaQuery.of(context).size.height,
                      width: 100 //MediaQuery.of(context).size.width / 1,
                      ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Large Area",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Area max 200x160x130",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rp. 2000.000 - 5000.000000",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.navigate_next,
                            size: (30),
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderCustomArea()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 7, //90,
              width: MediaQuery.of(context).size.width * 0.9,
              //alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(1, 1, 16, 1),
              //width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blueOrder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/hydro1.jpeg',
                      height: MediaQuery.of(context).size.height,
                      width: 100 //MediaQuery.of(context).size.width / 1,
                      ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Custom Area",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Area max 200x160x130",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text("> Rp. 5000.000000",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.navigate_next,
                            size: (30),
                            color: Colors.white,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

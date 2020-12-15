import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/HydroOrderAdmin/AdminHydroOrderList.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderList.dart';
import 'package:provider/provider.dart';

var blueColor = Color(0xFF3232FF);
var darkYellowColor = Color(0xFFAB9208);
var lightblue = Color(0xFFadd8e6);

class DashboardAdminOrder extends StatefulWidget {
  @override
  _DashboardAdminOrderState createState() => _DashboardAdminOrderState();
}

class _DashboardAdminOrderState extends State<DashboardAdminOrder> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Orders",
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
            backgroundColor: darkYellowColor,
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.blue[900],
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                  // color: Colors.lightBlue[900],
                    gradient: LinearGradient(
                        colors: [Colors.lightBlue[900], Colors.blue[200]]),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.lightBlue[900],
                        ))),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "HydroMarket",
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "HydroOrder",
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdminOrderList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdminHydroOrderList(),
            )
          ]),
        ));
  }
}

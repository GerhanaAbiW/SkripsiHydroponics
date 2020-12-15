import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/HydroOrderUser/UserHydroOrderList.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/ProductOrderUser/UserOrderList.dart';
import 'package:provider/provider.dart';

var blueColor = Color(0xFF3232FF);
var darkBlueColor = Color(0xFF3F51B5);
var lightblue = Color(0xFFadd8e6);

class DashboardUserOrder extends StatefulWidget {
  @override
  _DashboardUserOrderState createState() => _DashboardUserOrderState();
}

class _DashboardUserOrderState extends State<DashboardUserOrder> {


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
            backgroundColor: darkBlueColor,
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
              child: UserOrderList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserHydroOrderList(),
            )
          ]),
        ));
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/HydroOrderProvider.dart';
import 'package:hydroponics/core/Providers/OrderProvider.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/HydroOrderAdmin/AdminHydroOrderCard.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderCard.dart';
import 'package:provider/provider.dart';

class AdminHydroOrderList extends StatefulWidget {
  @override
  _AdminHydroOrderListState createState() => _AdminHydroOrderListState();
}

class _AdminHydroOrderListState extends State<AdminHydroOrderList> {
  @override
  void initState() {
    super.initState();
    Provider.of<HydroOrderProvider>(context,listen: false).getAdminListOrders();
  }
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<HydroOrderProvider>(context);
    return  ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: order.adminOrders.length == 0 || order.adminOrders.length == null
                  ? Padding(
                padding: const EdgeInsets.all(125.0),
                child: Image.asset('images/not_found.png'),
              )
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:
                order.adminOrders.length, //plantProvider.plants.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: AdminHydroOrderCard(
                      orderModel: order.adminOrders[index],
                    ),
                  );
                },
              )),
        ],
    );
  }


}

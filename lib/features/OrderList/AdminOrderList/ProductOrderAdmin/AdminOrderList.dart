import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Providers/OrderProvider.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderCard.dart';
import 'package:provider/provider.dart';

class AdminOrderList extends StatefulWidget {
  @override
  _AdminOrderListState createState() => _AdminOrderListState();
}

class _AdminOrderListState extends State<AdminOrderList> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).getListOrders();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);
    return Container(
        //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: order.orders.length == 0 || order.orders.length == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/not_found.png'),
                    width: 200,
                    height: 200,
                  ),
                ],
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: order.orders.length, //plantProvider.plants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: AdminOrderCard(
                        orderModel: order.orders[index],

                      ),
                    );
                  },
                ),
              ),
    );
  }
}

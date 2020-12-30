import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderDetails.dart';

class AdminOrderCard extends StatelessWidget {
  final OrderModel orderModel;
  AdminOrderCard({this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, //MediaQuery.of(context).size.height / 9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminOrderDetail(order: orderModel,)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60, //ScreenUtil().setWidth(60),
                        height: MediaQuery.of(context).size.height, //60,

                        child: Image.network(orderModel.cart[0].image,
                            height: MediaQuery.of(context).size.height,
                            width: 100 //MediaQuery.of(context).size.width / 1,
                            ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(orderModel.dateTime,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(orderModel.status,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey))
                          ]),
                    ),
                  ])),
                ],
              ))),
    );
  }
}

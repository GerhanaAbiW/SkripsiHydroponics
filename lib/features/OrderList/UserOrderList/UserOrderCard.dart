import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/AdminOrderDetails.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/UserOrderDetail.dart';


class CardMyListOrder extends StatelessWidget {
  final OrderModel orders;

  CardMyListOrder({this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 90, //MediaQuery.of(context).size.height / 9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
        //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserOrderDetail()));
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

                            child:
                            // plantPicture != null
                            //     ? ClipRRect(
                            //         borderRadius: BorderRadius.circular(
                            //             44), //ScreenUtil().setWidth(44)),
                            //         child: Image.network(
                            //           plantPicture,
                            //           fit: BoxFit.fitHeight,
                            //           height: 60, //ScreenUtil().setWidth(60),
                            //         ),
                            //       )
                            //     :

                            Image.asset('images/hydro1.jpeg',
                                height: MediaQuery.of(context).size.height,
                                width:
                                100 //MediaQuery.of(context).size.width / 1,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Hero(
                        //     tag: imgPath,
                        //     child: CircleAvatar(
                        //       radius: 30,
                        //       backgroundImage: ExactAssetImage(imgPath),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(width: 10.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(orders.status,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(orders.totalPrice.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.grey))
                              ]),
                        ),
                        //   Padding(
                        //       padding: const EdgeInsets.only(right: 2),
                        //       child: Icon(Icons.date_range)),
                        // ],
                        //)
                      ])),
                ],
              ))),
    );
  }
}

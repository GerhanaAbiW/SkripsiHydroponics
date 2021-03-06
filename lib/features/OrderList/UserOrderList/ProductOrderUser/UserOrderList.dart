import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/ProductOrderUser/UserOrderCard.dart';
import 'package:provider/provider.dart';

class UserOrderList extends StatefulWidget {
  @override
  _UserOrderListState createState() => _UserOrderListState();
}

class _UserOrderListState extends State<UserOrderList> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.getOrders();
    return
        // Container(
        //   child: SearchListAddPlantWidget(),
        // ),
        Container(
      //height: MediaQuery.of(context).size.height / 2,
      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: userProvider.hydroOrders == null ||
              userProvider.hydroOrders.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
              //height: 20,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              // ),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:
                    userProvider.orders.length, //plantProvider.plants.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: CardMyListOrder(
                      orders: userProvider.orders[index],
                    ),
                  );
                  // return Card(
                  //     elevation: 10.0,
                  //     child: InkWell(
                  //       onTap: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => MyPlantsDetail()));
                  //       },
                  //       child: ListTile(
                  //         leading: CircleAvatar(
                  //           radius: 30,
                  //           backgroundImage:
                  //               ExactAssetImage("images/plant.png"),
                  //         ),
                  //         title: Text(title[index],
                  //             style: TextStyle(fontSize: 14)),
                  //         subtitle:
                  //             Text(desc[index], style: TextStyle(fontSize: 10)),
                  //       ),
                  //     ));
                },
              ),
            ),
    );
  }
}

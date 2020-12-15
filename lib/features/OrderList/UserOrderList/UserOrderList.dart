import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/UserOrderCard.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    //userProvider.getOrders();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'My Orders',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          // Container(
          //   child: SearchListAddPlantWidget(),
          // ),
          Container(
              height: MediaQuery.of(context).size.height,
              //height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              ),
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: userProvider.orders.length == 0 ||
                      userProvider.orders.length == null
                  ? Padding(
                      padding: const EdgeInsets.all(125.0),
                      child: Image.asset('images/not_found.png'),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: userProvider
                          .orders.length, //plantProvider.plants.length,
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
                    )),
        ],
      ),
    );
  }
}

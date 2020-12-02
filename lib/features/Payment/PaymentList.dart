import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/Payment/PaymentCard.dart';
import 'package:provider/provider.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context,listen: false).getPayments();
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Payment List',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          //height: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
          ),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: user.payments.length, //plantProvider.plants.length,
            itemBuilder: (BuildContext context, int index) {
              return PaymentCard(paymentModel: user.payments[index],);
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
    );
  }
}

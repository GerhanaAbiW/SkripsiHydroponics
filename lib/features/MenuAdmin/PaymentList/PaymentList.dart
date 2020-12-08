import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Providers/PaymentProvider.dart';
import 'package:hydroponics/features/Payment/PaymentCard.dart';
import 'package:provider/provider.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    final payment = Provider.of<PaymentProvider>(context);
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
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: payment.adminPayments.length, //plantProvider.plants.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: PaymentCard(paymentModel: payment.adminPayments[index],)
                );
              },
            )),
      ],

    );
  }
}

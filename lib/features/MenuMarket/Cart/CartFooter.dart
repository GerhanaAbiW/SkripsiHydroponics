import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Utils/CustomUtils.dart';

class CartFooter extends StatefulWidget {
  // final List<CartItemModel> cart;
   final List<int> totals;
   const CartFooter({Key key, this.totals}) : super(key: key);

  @override
  _CartFooterState createState() => _CartFooterState();
}

class _CartFooterState extends State<CartFooter> {
  int totals;

  void getTotals(){
    for(int i=0; i<widget.totals.length; i++){
      totals = widget.totals[i] + widget.totals[i+1];
    }
  }
  @override
  void initState() {
    super.initState();
    getTotals();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.black, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$ $totals",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
          // RaisedButton(
          //   onPressed: () {
          //     changeScreen(context, CheckOutPage());
          //   },
          //   color: Colors.green,
          //   padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(24))),
          //   child: Text(
          //     "Checkout",
          //     style: CustomTextStyle.textFormFieldSemiBold
          //         .copyWith(color: Colors.white),
          //   ),
          // ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }
}

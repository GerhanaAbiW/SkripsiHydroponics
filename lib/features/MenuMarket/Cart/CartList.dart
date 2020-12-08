import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/features/MenuMarket/Cart/CartCard.dart';

class CartList extends StatefulWidget {
  final List<CartItemModel> cart;
  final GlobalKey<ScaffoldState> keys;
  final List<int> totals;
  const CartList({Key key, this.cart, this.keys, this.totals})
      : super(key: key);
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return CartCard(
          cart: widget.cart[index],
          totals: widget.totals,
          key: widget.keys,
        );
      },
      itemCount: widget.cart.length,
    );
  }
}

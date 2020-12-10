import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/AdminOrderDetails.dart';
import 'package:hydroponics/features/MenuMarket/CheckOut/CheckOut.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';

import 'package:hydroponics/core/Utils/CustomUtils.dart';
import 'package:hydroponics/features/MenuMarket/Market/Market.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _key = GlobalKey<ScaffoldState>();
  //List<int> totals;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        backgroundColor: Color(0xFF2b961f),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Shopping Cart',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: appProvider.isLoading
          ? Loading()
          : SafeArea(
              child: Container(
                  child: Column(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView(
                    children: <Widget>[
                      createHeader(),
                      createSubTitle(userProvider.userModel.cart.length),
                      createCartList(userProvider.userModel.cart),
                      footer(
                          context,
                          userProvider.userModel.totalCartPrice.toString(),
                          userProvider.userModel.cart)
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: ButtonButtom(
                        buttonText: 'Checkout',
                        onPressed: () {
                          changeScreen(
                              context,
                              CheckOutPage(
                                cart: userProvider.userModel.cart,
                              ));
                        }),
                  ),
                ),
              ])),
              // },
            ),
    );
  }

  footer(BuildContext context, String total, List<CartItemModel> cart) {
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
                  "\$" + total,
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
          // RaisedButton(
          //   onPressed: () {
          //     changeScreen(
          //         context,
          //         CheckOutPage(
          //           cart: cart,
          //         ));
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

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Your Cart",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 16, color: Color(0xFF2b961f)),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle(int totalItems) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total($totalItems) Items",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 12, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList(List<CartItemModel> cart) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(cart[index]);
      },
      itemCount: cart.length,
    );
  }

  createCartListItem(CartItemModel cart) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    int qty = cart.quantity;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  // image: DecorationImage(
                  // image: AssetImage(cart.image))
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: cart.image,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cart.name,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      // Text(
                      //   "Mantab",
                      //   style: CustomTextStyle.textFormFieldRegular
                      //       .copyWith(color: Colors.grey, fontSize: 14),
                      // ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rp${cart.price} ",
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qty -= 1;
                                      });

                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          color: Colors.green),
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "$qty",
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qty += 1;
                                      });

                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          color: Colors.green),
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: GestureDetector(
              onTap: () async {
                appProvider.changeIsLoading();
                bool success =
                    await userProvider.removeFromCart(cartItem: cart);
                if (success) {
                  userProvider.reloadUserModel();
                  print("Item remove from cart");
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text("Removed from Cart!")));
                  appProvider.changeIsLoading();
                  return;
                } else {
                  appProvider.changeIsLoading();
                }
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.red),
          ),
        )
      ],
    );
  }
}

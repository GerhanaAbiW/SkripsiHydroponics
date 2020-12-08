import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Utils/CustomUtils.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CartCard extends StatefulWidget {
  final CartItemModel cart;
  final GlobalKey<ScaffoldState> keys;
  final List<int> totals;
  const CartCard({Key key, this.cart, this.keys, this.totals})
      : super(key: key);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int qty;
  int total;
  final _key = GlobalKey<ScaffoldState>();
  // int pricePerItems;

  @override
  void initState() {
    qty = widget.cart.quantity;
    super.initState();
  }

  void addQty() {
    setState(() {
      qty += 1;
    });
    total = qty * widget.cart.price;
    widget.totals.add(total);
  }

  void minusQty() {
    setState(() {
      qty -= 1;
    });
    total = qty * widget.cart.price;
    widget.totals.add(total);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
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
                          image: widget.cart.image,
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
                          widget.cart.name,
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
                              "\Rp${widget.cart.price} ",
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
                                    onTap: () => minusQty(),
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
                                    onTap: () => addQty(),
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
                    await userProvider.removeFromCart(cartItem: widget.cart);
                if (success) {
                  userProvider.reloadUserModel();
                  print("Item remove from cart");
                  widget.keys.currentState.showSnackBar(
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

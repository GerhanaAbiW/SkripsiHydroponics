import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

// import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuMarket/Market/Market.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:hydroponics/features/Widget/Loading2.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CheckOutPage extends StatefulWidget {
  final List<CartItemModel> cart;
  final String address;
  final String phone;
  final int total;
  final int totalQty;

  const CheckOutPage(
      {Key key, this.cart, this.total, this.address, this.phone, this.totalQty})
      : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final currencyFormatter = NumberFormat('#,##0.00', 'ID');
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  OrderServices _orderServices = OrderServices();
  final int delivery = 15000;
  bool del = false;
  bool ins = false;
  double totals;
  String estimatedDate;
  DateTime estimated;
  double tax;
  String address;
  String phone;

  void getEstimatied() {
    DateFormat formatter = DateFormat('dd-MMM-yyyy');
    estimated = DateTime.now().add(Duration(days: 3));
    estimatedDate = formatter.format(estimated);
  }

  void getTotals() {
    setState(() {
      tax = widget.total * 0.01;
      totals = widget.total + tax + delivery;
    });
  }

  @override
  void initState() {
    super.initState();
    getTotals();
    getEstimatied();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // final appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
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
            'Check Out',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      selectedAddressSection(userProvider.userModel),
                      standardDelivery(),
                      checkoutItem(widget.cart),
                      priceSection()
                    ],
                  ),
                ),
                flex: 75,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Container(
                    width: double.infinity,
                    // height: ScreenUtil().setHeight(38),
                    height: 40,
                    margin: EdgeInsets.only(bottom: 24),
                    child: FlatButton(
                      color: Color(0xFF2b961f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "ORDER NOW",
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (address != null || phone != null) {
                          _orderServices.createOrder(
                              userName: userProvider.userModel.name,
                              phone: phone,
                              delivery: delivery,
                              estimatedDate: estimatedDate,
                              totalQtyProduct: widget.totalQty,
                              address: address,
                              userId: userProvider.userModel.id,
                              description: "Some random description",
                              tax: tax,
                              price: widget.total,
                              instalation: 0,
                              totalPrice: totals,
                              cart: widget.cart);
                          for (CartItemModel cartItem
                              in userProvider.userModel.cart) {
                            bool value = await userProvider.removeFromCart(
                                cartItem: cartItem);
                            if (value) {
                              userProvider.reloadUserModel();
                              print("Item added to cart");
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text("Removed from Cart!")));
                            } else {
                              print("ITEM WAS NOT REMOVED");
                            }
                          }
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Order created!")));
                          changeScreen(context, MenuMarket());
                        } else {
                          showSnackBar(
                              "Please Add Your Phone Number and Your Address ",
                              _scaffoldKey);
                        }
                      },
                    ),
                  ),
                ),
                flex: 10,
              )
              // Expanded(
              //   child: Row(
              //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              //         child: ButtonButtom(
              //           buttonText: 'Order Now',
              //           onPressed: () async{
              //             if(address!=null || phone !=null){
              //               _orderServices.createOrder(
              //                 userName: userProvider.userModel.name,
              //                   phone: phone,
              //                   totalQtyProduct: widget.totalQty,
              //                   address: address,
              //                   userId: userProvider.userModel.id,
              //                   description: "Some random description",
              //                   tax: tax,
              //                   instalation: 0,
              //                   totalPrice: totals,
              //                   cart: widget.cart);
              //               for (CartItemModel cartItem in userProvider.userModel.cart) {
              //                 bool value = await userProvider.removeFromCart(
              //                     cartItem: cartItem);
              //                 if (value) {
              //                   userProvider.reloadUserModel();
              //                   print("Item added to cart");
              //                   _scaffoldKey.currentState.showSnackBar(
              //                       SnackBar(content: Text("Removed from Cart!")));
              //                 } else {
              //                   print("ITEM WAS NOT REMOVED");
              //                 }
              //               }
              //               _scaffoldKey.currentState.showSnackBar(
              //                   SnackBar(content: Text("Order created!")));
              //               changeScreen(context, MenuMarket());
              //             }else{
              //               showSnackBar("Please Add Your Phone Number and Your Address ", _scaffoldKey);
              //             }
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              //   flex: 10,
              // )
            ],
          );
        }),
      ),
    );
  }

  showThankYouBottomSheet(BuildContext context) {
    return _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage("images/ic_thank_you.png"),
                    width: 300,
                  ),
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                            style: CustomTextStyle.textFormFieldMedium.copyWith(
                                fontSize: 14, color: Colors.grey.shade800),
                          )
                        ])),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        "Track Order",
                        style: CustomTextStyle.textFormFieldMedium
                            .copyWith(color: Colors.white),
                      ),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    )
                  ],
                ),
              ),
              flex: 5,
            )
          ],
        ),
      );
    },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        elevation: 2);
  }

  selectedAddressSection(UserModel user) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    user.name,
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 14),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "HOME",
                      style: CustomTextStyle.textFormFieldBlack.copyWith(
                          color: Colors.indigoAccent.shade200, fontSize: 8),
                    ),
                  )
                ],
              ),
              Container(
                  child: address == null
                      ? createAddressText("Address : No data", 16)
                      : createAddressText(address, 16)),

              // createAddressText("Mumbai - 400023", 6),
              // createAddressText("Maharashtra", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: phone == null ? "No data" : phone,
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              addressAction()
            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: CustomTextStyle.textFormFieldMedium
            .copyWith(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  addressAction() {
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: GestureDetector(
                              onTap: () {
                                backScreen(context);
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: MultilineFormTextField(
                                      controller: addressController,
                                      textHint: "Add Your Adrress",
                                      textLabel: "Input Address"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FormTextField(
                                      textType: TextInputType.number,
                                      controller: phoneController,
                                      textHint: "Add Your Phone Number",
                                      textLabel: "Input Phone Number"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Save"),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          address = addressController.text;
                                          phone = phoneController.text;
                                        });
                                        _formKey.currentState.save();
                                        backScreen(context);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text(
              "Edit Address",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(fontSize: 12, color: Colors.indigo.shade700),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          // Spacer(
          //   flex: 3,
          // ),
          // Container(
          //   height: 20,
          //   width: 1,
          //   color: Colors.grey,
          // ),
          // Spacer(
          //   flex: 3,
          // ),
          // FlatButton(
          //   onPressed: () {},
          //   child: Text("Add New Address",
          //       style: CustomTextStyle.textFormFieldSemiBold
          //           .copyWith(fontSize: 12, color: Colors.indigo.shade700)),
          //   splashColor: Colors.transparent,
          //   highlightColor: Colors.transparent,
          // ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border:
              Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Standard Delivery",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get it by 20 jul - 27 jul | Free Delivery",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  checkoutItem(List<CartItemModel> cart) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return checkoutListItem(cart[position]);
            },
            itemCount: cart.length,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  checkoutListItem(CartItemModel cart) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Container(
            width: 35,
            height: 45,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Container(height: 40, width: 30, child: Loading2()),
                )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: cart.image,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          ),
          SizedBox(
            width: 8,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Estimated Delivery : ",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(fontSize: 12)),
              TextSpan(
                  text: estimatedDate,
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600))
            ]),
          )
        ],
      ),
    );
  }

  priceSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Text(
                "PRICE DETAILS",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              // createPriceItem("Total MRP", "getFormattedCurrency(5197)",
              //     Colors.grey.shade700),
              // createPriceItem("Bag discount", "getFormattedCurrency(3280)",
              //     Colors.teal.shade300),

              createPriceItem(
                  "Order Total",
                  "Rp. " + currencyFormatter.format(widget.total).toString(),
                  Colors.grey.shade700),
              createPriceItem(
                  "Tax (10%)",
                  "Rp. " + currencyFormatter.format(tax).toString(),
                  Colors.grey.shade700),
              Container(
                child: createPriceItem(
                    "Delievery",
                    "Rp. " + currencyFormatter.format(delivery).toString(),
                    Colors.teal.shade300),
              ),

              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "Rp. " + currencyFormatter.format(totals).toString(),
                    style: CustomTextStyle.textFormFieldMedium
                        .copyWith(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//   String getFormattedCurrency(double amount) {
//     FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
//         amount: amount,
//         settings: MoneyFormatterSettings(
//           symbol: '₹',
//           thousandSeparator: '.',
//           decimalSeparator: ',',
//           symbolAndNumberSeparator: ' ',
//           //fractionDigits: 3,
//           //compactFormatType: CompactFormatType.sort
//         ));
//     return fmf.output.compactSymbolOnLeft;
// //    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(amount: amount);
// //    fmf.L = "₹";
// //    fmf.thousandSeparator = ",";
// //    fmf.decimalSeparator = ".";
// //    fmf.spaceBetweenSymbolAndNumber = true;
// //    return fmf.formattedLeftSymbol;
//   }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}

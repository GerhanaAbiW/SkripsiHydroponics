import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Models/Product.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';

// import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuMarket/Market/Market.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/DashboardUserOrder.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/ProductOrderUser/ProductUploadPayment.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:hydroponics/features/Widget/Loading2.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class UserOrderDetail extends StatefulWidget {
  final OrderModel order;

  const UserOrderDetail({Key key, this.order}) : super(key: key);

  @override
  _UserOrderDetailState createState() => _UserOrderDetailState();
}

class _UserOrderDetailState extends State<UserOrderDetail> {
  final currencyFormatter = NumberFormat('#,##0.00', 'ID');

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  OrderServices _orderServices = OrderServices();
  bool btn = true;
  bool img = true;

  void visibleBtn() {
    if (widget.order.status == "Accepted") {
      setState(() {
        btn = false;
      });
    } else {
      setState(() {
        btn = true;
      });
    }
  }

  void visibleImg() {
    if (widget.order.imagePayment != null) {
      setState(() {
        img = false;
      });
    } else {
      setState(() {
        img = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    visibleBtn();
    visibleImg();
  }

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: darkYellowColor, //Color(0xFF2b961f),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Order Detail',
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
                      selectedAddressSectionAdmin(),
                      selectedAddressSection(),
                      standardDelivery(),
                      checkoutItem(widget.order.cart),
                      priceSection(),
                      resiNumber(),
                      Offstage(
                        offstage: img,
                        child: transactionProvement(),
                      )
                    ],
                  ),
                ),
                flex: 75,
              ),
              Expanded(
                child: Offstage(
                  offstage: btn,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: ButtonButtom(
                      color: darkYellowColor,
                      buttonText: 'Upload Your Transaction',
                      onPressed: () {
                        changeScreen(
                            context,
                            UploadPayment(
                              id: widget.order.id,
                            ));
                      },
                    ),
                  ),
                ),
                flex: 10,
              )
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

  resiNumber() {
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
                "Nomor Resi Anda",
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
                  "Nomor Resi : ", widget.order.resi, Colors.teal.shade300),

              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectedAddressSectionAdmin() {
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
                    "Harap Melakukan Pembayaran",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 14),
                  ),
                  // Container(
                  //   padding:
                  //       EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.rectangle,
                  //       color: Colors.grey.shade300,
                  //       borderRadius: BorderRadius.all(Radius.circular(16))),
                  //   child: Text(
                  //     "Seller Info",
                  //     style: CustomTextStyle.textFormFieldBlack.copyWith(
                  //         color: Colors.indigoAccent.shade200, fontSize: 8),
                  //   ),
                  // )
                ],
              ),

              createAddressText("Nama Bank : BCA", 16),
              createAddressText("Atas Nama : Gerhana Abi W", 6),

              // createAddressText("Mumbai - 400023", 6),
              // createAddressText("Maharashtra", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Nomor Rekening : ",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: "01934749373",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   color: Colors.grey.shade300,
              //   height: 1,
              //   width: double.infinity,
              // ),
              //addressAction()
            ],
          ),
        ),
      ),
    );
  }

  selectedAddressSection() {
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
                    widget.order.userName,
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 14),
                  ),
                  // Container(
                  //   padding:
                  //       EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.rectangle,
                  //       color: Colors.grey.shade300,
                  //       borderRadius: BorderRadius.all(Radius.circular(16))),
                  //   child: Text(
                  //     "Customer Info",
                  //     style: CustomTextStyle.textFormFieldBlack.copyWith(
                  //         color: Colors.indigoAccent.shade200, fontSize: 8),
                  //   ),
                  // )
                ],
              ),
              createAddressText("Alamat : " + widget.order.userAddress, 16),

              // createAddressText("Mumbai - 400023", 6),
              // createAddressText("Maharashtra", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Nomor Telepon : ",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: widget.order.phone,
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   color: Colors.grey.shade300,
              //   height: 1,
              //   width: double.infinity,
              // ),
              //addressAction()
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

  // addressAction() {
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         Spacer(
  //           flex: 2,
  //         ),
  //         FlatButton(
  //           onPressed: () {
  //             showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) {
  //                   return AlertDialog(
  //                     content: Stack(
  //                       overflow: Overflow.visible,
  //                       children: <Widget>[
  //                         Positioned(
  //                           right: -40.0,
  //                           top: -40.0,
  //                           child: GestureDetector(
  //                             onTap: () {
  //                               backScreen(context);
  //                             },
  //                             child: CircleAvatar(
  //                               child: Icon(Icons.close),
  //                               backgroundColor: Colors.red,
  //                             ),
  //                           ),
  //                         ),
  //                         Form(
  //                           key: _formKey,
  //                           child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             children: <Widget>[
  //                               Padding(
  //                                 padding: EdgeInsets.all(8.0),
  //                                 child: MultilineFormTextField(
  //                                     controller: addressController,
  //                                     textHint: "Add Your Adrress",
  //                                     textLabel: "Input Address"
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: EdgeInsets.all(8.0),
  //                                 child: FormTextField(
  //                                     controller: phoneController,
  //                                     textHint: "Add Your Phone Number",
  //                                     textLabel: "Input Phone Number"
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.all(8.0),
  //                                 child: RaisedButton(
  //                                   child: Text("Save"),
  //                                   onPressed: () {
  //                                     if (_formKey.currentState.validate()) {
  //                                       setState(() {
  //                                         address = addressController.text;
  //                                         phone = phoneController.text;
  //                                       });
  //                                       _formKey.currentState.save();
  //                                       backScreen(context);
  //                                     }
  //                                   },
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 });
  //           },
  //           child: Text(
  //             "Edit Address",
  //             style: CustomTextStyle.textFormFieldSemiBold
  //                 .copyWith(fontSize: 12, color: Colors.indigo.shade700),
  //           ),
  //           splashColor: Colors.transparent,
  //           highlightColor: Colors.transparent,
  //         ),
  //         // Spacer(
  //         //   flex: 3,
  //         // ),
  //         // Container(
  //         //   height: 20,
  //         //   width: 1,
  //         //   color: Colors.grey,
  //         // ),
  //         // Spacer(
  //         //   flex: 3,
  //         // ),
  //         // FlatButton(
  //         //   onPressed: () {},
  //         //   child: Text("Add New Address",
  //         //       style: CustomTextStyle.textFormFieldSemiBold
  //         //           .copyWith(fontSize: 12, color: Colors.indigo.shade700)),
  //         //   splashColor: Colors.transparent,
  //         //   highlightColor: Colors.transparent,
  //         // ),
  //         Spacer(
  //           flex: 2,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.lime.withOpacity(0.4), width: 1),
          color: Colors.lime.withOpacity(0.2)),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.lime.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Estimasi Pengiriman",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.order.estimatedTime,
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
                  child: Container(width: 30, height: 40, child: Loading2()),
                )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: cart.image,
                    width: MediaQuery.of(context).size.width,
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
              // TextSpan(
              //     text: "Product Name : ",
              //     style: CustomTextStyle.textFormFieldMedium
              //         .copyWith(fontSize: 12)),
              TextSpan(
                  text: ProductModel.NAME + "(" + ProductModel.QUANTITY + ")",
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
                "Detail Harga",
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
                  "Harga",
                  "Rp. " +
                      currencyFormatter.format(widget.order.price).toString(),
                  Colors.grey.shade700),
              createPriceItem(
                  "PPN (10%)",
                  "Rp. " +
                      currencyFormatter.format(widget.order.tax).toString(),
                  Colors.grey.shade700),
              Container(
                child: widget.order.delivery == 0
                    ? createPriceItem(
                        "Ongkos Kirim",
                        "Rp. " +
                            currencyFormatter
                                .format(widget.order.instalation.toDouble())
                                .toString(),
                        Colors.teal.shade300)
                    : createPriceItem(
                        "Ongkos Kirim",
                        "Rp. " +
                            currencyFormatter
                                .format(widget.order.delivery.toDouble())
                                .toString(),
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
                    "Rp. " +
                        currencyFormatter
                            .format(widget.order.totalPrice)
                            .toString(),
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

  transactionProvement() {
    return Center(
        child: Column(children: <Widget>[
      Text('Bukti Transfer'),
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.brown,
            width: 10,
          ),
        ),
        child: widget.order.imagePayment == null
            ? Text("nodata")
            : Image.network(widget.order.imagePayment),
      ),
    ]));
  }
}

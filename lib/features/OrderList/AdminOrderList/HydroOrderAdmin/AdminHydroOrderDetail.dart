import 'package:flutter/material.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/HydroOrderModel.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/HydroOrderService.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuMarket/Market/Market.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/HydroOrderAdmin/AdminHydroOrderList.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/DashboardUserOrder.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:intl/intl.dart';

class AdminHydroOrderDetail extends StatefulWidget {
  final HydroOrderModel order;

  const AdminHydroOrderDetail({Key key, this.order}) : super(key: key);

  @override
  _AdminHydroOrderDetailState createState() => _AdminHydroOrderDetailState();
}

class _AdminHydroOrderDetailState extends State<AdminHydroOrderDetail> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final currencyFormatter = NumberFormat('#,##0.00', 'ID');
  HydroOrderServices _hydroOrderServices = HydroOrderServices();
  TextEditingController resiController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
          backgroundColor: darkYellowColor,
          //Color(0xFF2b961f),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Customer Hydro Order',
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
                      selectedAddressSection(),
                      standardDelivery(),
                      checkoutHydroItem(),
                      priceSection(),
                      resiNumber(),
                      transactionProvement(),
                    ],
                  ),
                ),
                flex: 75,
              ),
              Expanded(
                child:  widget.order.status == "Process"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 0),
                                child: ButtonRejectAcc(
                                  color: darkYellowColor,
                                  buttonText: 'Reject',
                                  onPressed: () {
                                    _hydroOrderServices.updateHydroOrder(
                                        status: "Rejected",
                                        id: widget.order.id,
                                        resi: widget.order.resi,
                                        img: widget.order.imagePayment);
                                    changeScreen(context, DashBoard());
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 0),
                                child: ButtonRejectAcc(
                                  color: darkYellowColor,
                                  buttonText: 'Proccess',
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
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Masukkan Catatan Untuk Pelanggan",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: FormTextField(
                                                            controller:
                                                                resiController,
                                                            textHint:
                                                                "Masukkan Catatan",
                                                            textLabel:
                                                                "Masukkan Catatan"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RaisedButton(
                                                          child: Text("Save"),
                                                          onPressed: () {
                                                            if (_formKey
                                                                .currentState
                                                                .validate()) {
                                                              _hydroOrderServices
                                                                  .updateHydroOrder(
                                                                      status:
                                                                          "Accepted",
                                                                      resi: resiController
                                                                          .text,
                                                                      id: widget
                                                                          .order
                                                                          .id,
                                                                      img: widget
                                                                          .order
                                                                          .imagePayment);
                                                              changeScreen(
                                                                  context,
                                                                  DashBoard());
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
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 1,
                          ),
                flex: 10,
              )
            ],
          );
        }),
      ),
    );
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
                "Catatan",
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
                  "Catatan : ", widget.order.resi, Colors.teal.shade300),

              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
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
                      color: darkYellowColor,
                      //Colors.pink,
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
                "HydroMachine",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              // SizedBox(
              //   height: 5,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  checkoutHydroItem() {
    return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  height: 120,
                  width: 150,
                  child: Image.asset(widget.order.hydroImage)),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: <Widget>[
                    Text(widget.order.hydroType),
                    //Text(widget.landType),
                    Text("Jumlah Pipa : " + widget.order.pipeQTY),
                    Text("Jumlah Lubang Tanam : " + widget.order.holeQTY),
                    Text("Tipe Lahan : " + widget.order.landType),
                  ],
                ),
              ),
            ],
          ),
        ));
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
              // Container(
              //   child: widget.order.delivery != 0
              //       ?
              // (
              createPriceItem(
                  "Instalasi",
                  "Rp. " +
                      currencyFormatter
                          .format(widget.order.instalation)
                          .toString(),
                  Colors.teal.shade300),
              createPriceItem(
                  "Ongkos Kirim",
                  "Rp. " +
                      currencyFormatter
                          .format(widget.order.delivery)
                          .toString(),
                  Colors.teal.shade300),
              // : createPriceItem(
              //     "Delivery",
              //     "Rp. " +
              //         currencyFormatter
              //             .format(widget.order.delivery)
              //             .toString(),
              //     Colors.teal.shade300),
              // ),

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
            ? Text("Unpaid",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(color: darkYellowColor, fontSize: 12))
            : Image.network(widget.order.imagePayment),
      ),
    ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/HydroOrderService.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOrderCheckOut.dart';
import 'package:hydroponics/features/MenuHydroOrder/ViewModel/DetailType.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:provider/provider.dart';

class HydroOrderCustomDetail extends StatefulWidget {
  final HydroType hydroType;

  HydroOrderCustomDetail({this.hydroType});

  @override
  _HydroOrderCustomDetailState createState() => _HydroOrderCustomDetailState();
}

class _HydroOrderCustomDetailState extends State<HydroOrderCustomDetail> {
  TextEditingController nomorHpController = TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 40.0,
                  ),
                  height: 400.0,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF32A060),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      // Column(
                      //   children: [
                      //     IconButton(icon: Icon(
                      //           Icons.arrow_back,
                      //           size: 30.0,
                      //           color: Colors.white,
                      //         ), onPressed:()=> Navigator.pop(context)),
                      //   ],
                      // ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.hydroType.type,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Hero(
                            tag: widget.hydroType.image,
                            child: Image(
                              height: 200.0,
                              width: 280.0,
                              image: AssetImage(widget.hydroType.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),

                      // Icon(
                      //   Icons.shopping_cart,
                      //   size: 30.0,
                      //   color: Colors.white,
                      // ),
                      //   ],
                      // ),
                      // SizedBox(height: 20.0),
                      // Text(
                      //  " widget.plant.category.toUpperCase()",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 15.0,
                      //   ),
                      // ),
                      // SizedBox(height: 5.0),
                      // Text(
                      //   "widget.plant.name",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 30.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 40.0),
                      // Text(
                      //   'FROM',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 15.0,
                      //   ),
                      // ),
                      // SizedBox(height: 5.0),
                      // Text(
                      //   "\$${widget.hydroType.price}",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 25.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 40.0),
                      // Text(
                      //   'SIZE',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 15.0,
                      //   ),
                      // ),
                      // SizedBox(height: 5.0),
                      // Text(
                      //   "widget.plant.size",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 25.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 40.0),
                      // RawMaterialButton(
                      //   padding: EdgeInsets.all(20.0),
                      //   shape: CircleBorder(),
                      //   elevation: 2.0,
                      //   fillColor: Colors.black,
                      //   child: Icon(
                      //     Icons.add_shopping_cart,
                      //     color: Colors.white,
                      //     size: 35.0,
                      //   ),
                      //   onPressed: () => print('Add to cart'),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 400.0,
                  transform: Matrix4.translationValues(0.0, -60.0, 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'All to know...',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.hydroType.description,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 20.0,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Custom Order Form',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              FormTextField(
                                textType: TextInputType.number,
                                textLabel: "Nomor HP",
                                textHint: "Masukkan Nomor HP Anda",
                                controller: nomorHpController,
                              ),
                              SizedBox(height: 10),
                              MultilineFormTextField(
                                  textType: TextInputType.multiline,
                                  textLabel: "Alamat",
                                  textHint: "Masukkan Alamat Anda",
                                  controller: alamatController,
                                  height: 20.0),
                              SizedBox(height: 30),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      changeScreen(
                                          context,
                                          HydroOrderCheckOut(
                                            hydroType: widget.hydroType,
                                            jmlLubang: "-",
                                            jmlPipa: "-",
                                            address: alamatController.text,
                                            landType: "-",
                                            phone: nomorHpController.text,
                                            userModel: model.userModel,
                                          ));
                                      _formKey.currentState.reset();
                                    } else {}
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFF03A9F4)),
                                    child: Text(
                                      'ORDER',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

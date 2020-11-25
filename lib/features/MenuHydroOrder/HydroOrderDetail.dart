import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Services/OrderServices.dart';
import 'package:hydroponics/features/MenuHydroOrder/ViewModel/DetailType.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:provider/provider.dart';

class HydroOrderDetail extends StatefulWidget {
  final HydroType hydroType;

  const HydroOrderDetail({Key key, this.hydroType}) : super(key: key);

  @override
  _HydroOrderDetailState createState() => _HydroOrderDetailState();
}

class _HydroOrderDetailState extends State<HydroOrderDetail> {
  String _currentTipeLahan;

  changeSelectedCategory(String selectedTipeLahan) {
    setState(() => _currentTipeLahan = selectedTipeLahan);
  }

  TextEditingController jumlahPipa = TextEditingController();
  TextEditingController jumlahLubangController = TextEditingController();
  TextEditingController nomorHpController = TextEditingController();
  TextEditingController alamatController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  OrderServices orderServices = OrderServices();

  void validateAndUpload(String userId) async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      orderServices.createHydroOrder({
        "userId": userId,
        "address" : alamatController.text,
        "phone" : nomorHpController.text,
        "holeQuantity" : jumlahLubangController.text,
        "pipeQuantity" : jumlahPipa.text,
        "hydroType" : widget.hydroType.type,
        "image" : widget.hydroType.image,
        "price" : widget.hydroType.price,
        "landType" : _currentTipeLahan

      });
      _formKey.currentState.reset();
      setState(() => isLoading = false);
      Navigator.pop(context);
    } else {
      setState(() => isLoading = false);

    }
  }

  final List<Map<String, dynamic>> areaItems = [
    {
      'value': 'Vertikal',
      'label': 'Vertikal',
    },
    {
      'value': 'Horizontal',
      'label': 'Horizontal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, model, child) => Scaffold(
                body: ListView(
              children: <Widget>[
                Stack(children: [
                  Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 12.0,
                              spreadRadius: 7.0)
                        ]),
                  ),
                  Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                      color: Color(0xFF03A9F4).withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    left: 10.0,
                    right: 10.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //We need to tilt the image slightly
                  Positioned(
                      top: 45.0,
                      left: 15.0,
                      right: 15.0,
                      child: Hero(
                          tag: widget.hydroType.image,
                          child: RotationTransition(
                              turns: AlwaysStoppedAnimation(360),
                              child: Container(
                                height: 250,
                                //MediaQuery.of(context).size.height /200,
                                width: 250.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            widget.hydroType.image))),
                              )))),
                  Positioned(
                    top: 375.0,
                    left: 15.0,
                    right: 15.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("HydroType: ${widget.hydroType.type}",
                                      style: TextStyle(
                                          fontFamily: 'AbrilFatFace',
                                          fontSize: 20.0,
                                          color: Color(0xFF03A9F4))),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Description Product",
                                      style: TextStyle(
                                          fontFamily: 'AbrilFatFace',
                                          fontSize: 18.0,
                                          color: Colors.grey))
                                ],
                              ),
                              Text("Rp.${widget.hydroType.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Color(0xFF03A9F4)))
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Text('Luas Maximum : ${widget.hydroType.area}',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey)),
                          Text('Tipe Lahan Tanam : ${widget.hydroType.landType}',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey)),
                          Text(
                              "Tingkat Paralon Minimum - Maximum : ${widget.hydroType.pipeQty}",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey)),
                          Text(
                              'Jumlah Lubang tanam Minimum - Maximum : ${widget.hydroType.holeQty}',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey))
                        ],
                      ),
                    ),
                  )
                ]),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Mohon Untuk Lengkapi Data Order',
                                          style: TextStyle(
                                            fontFamily: 'AbrilFatFace',
                                            fontSize: 20.0,
                                            color: Colors.green,
                                          )),
                                      Text(
                                          '*Di mohon untuk mengisi data yang sesuai',
                                          style: TextStyle(
                                              fontFamily: 'AbrilFatFace',
                                              fontSize: 11.0,
                                              color: Colors.grey))
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),
                              FormTextField(
                                textLabel: "jumlah Lubang",
                                textHint: "Masukkan Jumlah Lubang Tanaman",
                                controller: jumlahLubangController,
                                textType: TextInputType.number
                              ),
                              //),
                              //Container(
                              SizedBox(height: 16),
                              FormTextField(
                                textType: TextInputType.number,
                                textLabel: "Nomor HP",
                                textHint: "Masukkan Nomor HP Anda",
                                controller: nomorHpController,
                              ),
                              //),
                              // Container(
                              //   child:
                              SizedBox(height: 16),
                              DropdownForm(
                                  textLabel: "Tipe Lahan",
                                  textHint: "Masukkan Type Lahan",
                                  selectedItem: _currentTipeLahan,
                                  dropDownItems: areaItems,
                                  changedDropDownItems: changeSelectedCategory),
                              // FormDropDown(
                              //     labelText: "Tipe Lahan",
                              //     hintText: "Masukkan Type Lahan",
                              //     selectedItem: _currentTipeLahan,
                              //     dropDownItems: typelahanDropdown,
                              //     changedDropDownItems: changeSelectedCategory),
                              SizedBox(height: 16),
                              MultilineFormTextField(
                                  textType: TextInputType.multiline,
                                  textLabel: "Alamat",
                                  textHint: "Masukkan Alamat Anda",
                                  controller: alamatController,
                                  height: 20.0),
                              // Container(
                              //   child: Text(
                              //       'Whether it\'s an impromptu gathering with good friends or sustainbly canning wine to keep up with your daily adventures. Together we seek the uncommon.',
                              //       style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              validateAndUpload(model.userModel.id);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.8,
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
            )));
  }
}

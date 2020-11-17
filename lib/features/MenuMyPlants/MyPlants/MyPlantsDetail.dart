import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/MyPlants.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsList.dart';
import 'package:provider/provider.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);
var productImage =
    'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/4/4/67339064/67339064_0e9a5822-c3db-49fb-be1a-ea1f3ad177e4_336_336.jpg';
//'https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png';

class PlantStartRecord extends StatefulWidget {
  final MyPlantsModel myPlantsModel;

  const PlantStartRecord({Key key, this.myPlantsModel}) : super(key: key);

  @override
  _PlantStartRecordState createState() => _PlantStartRecordState();
}

class _PlantStartRecordState extends State<PlantStartRecord> {
  bool mediaSemai = false;
  bool waktuSemai = true;
  bool jenisPupuk = true;
  bool dosisPupuk = true;
  bool waktuPupuk = true;
  bool waktuPanen = true;
  bool phIdeal = true;
  bool ppmIdeal = true;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        key: _key,
        backgroundColor: greenColor,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(300.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 60, 10),
                                child: Text(widget.myPlantsModel.plant,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: darkGreenColor,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.network(
                                widget.myPlantsModel.image,
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Karakteristik",
                              style: TextStyle(
                                  color: darkGreenColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          Text("*NOTE : isi mendekati waktu panen",
                              style: TextStyle(
                                  color: darkGreenColor,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(mediaSemai, "Media Semai",
                              widget.myPlantsModel.media),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(waktuSemai, "Waktu Semai",
                              widget.myPlantsModel.media),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(jenisPupuk, "Jenis Pupuk",
                              widget.myPlantsModel.fertilizerType),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(dosisPupuk, "Dosis Pupuk",
                              widget.myPlantsModel.dosageFertilizer),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(waktuPupuk, "Waktu Pemupukan",
                              widget.myPlantsModel.timeOfFertilizer),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(waktuPanen, "Waktu Panen",
                              widget.myPlantsModel.harvestTime),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(
                              ppmIdeal, "PPM Ideal", widget.myPlantsModel.ppm),
                          SizedBox(
                            height: 20,
                          ),
                          Characteristics(
                              phIdeal, "PH Ideal", widget.myPlantsModel.ph),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                appProvider.changeIsLoading();
                                bool success =
                                    await userProvider.addMyPlantRecord(
                                        myPlants: widget.myPlantsModel,
                                        waktuPanen: waktuPanen,
                                        waktuPupuk: waktuPupuk,
                                        waktuSemai: waktuSemai,
                                        phIdeal: phIdeal,
                                        dosisPupuk: dosisPupuk,
                                        ppmIdeal: ppmIdeal,
                                        jenisPupuk: jenisPupuk);
                                if (success) {
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Added to Cart!")));
                                  userProvider.reloadUserModel();
                                  appProvider.changeIsLoading();
                                  return;
                                } else {
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Not added to Cart!")));
                                  appProvider.changeIsLoading();
                                  return;
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: darkGreenColor),
                                child: Text(
                                  'Record',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),

                      //SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 38.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         SizedBox(height: 16.0),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Icon(
            //               Icons.arrow_upward,
            //               size: (15),
            //               color: white,
            //             ),
            //             SizedBox(
            //               width: 2,
            //             ),
            //             Text("Tekan Untuk Tanam",
            //                 style: TextStyle(
            //                     color: white,
            //                     fontSize: 14.0,
            //                     fontWeight: FontWeight.normal)),
            //           ],
            //         ),
            //         // Text('Must be Considered',
            //         //     style: TextStyle(color: Colors.white)),
            //         Spacer(),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             Container(
            //               height: 100.0,
            //               width: MediaQuery.of(context).size.width / 2 - 50,
            //               decoration: BoxDecoration(
            //                   color: darkGreenColor,
            //                   borderRadius: BorderRadius.only(
            //                       topLeft: Radius.circular(32.0),
            //                       topRight: Radius.circular(32.0))),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: <Widget>[
            //                       Text(
            //                         '6,5 - 7,0',
            //                         style: TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 20.0),
            //                       ),
            //                       //SizedBox(width: 8.0),
            //                       // Text(
            //                       //   'ml',
            //                       //   style: TextStyle(color: Colors.white54),
            //                       // )
            //                     ],
            //                   ),
            //                   Text(
            //                     'PH Ideal',
            //                     style: TextStyle(color: Colors.white54),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             Container(
            //               height: 100.0,
            //               width: MediaQuery.of(context).size.width / 2 - 50,
            //               decoration: BoxDecoration(
            //                   color: darkGreenColor,
            //                   borderRadius: BorderRadius.only(
            //                       topLeft: Radius.circular(32.0),
            //                       topRight: Radius.circular(32.0))),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: <Widget>[
            //                       Text(
            //                         '1750 - 2100',
            //                         style: TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 20.0),
            //                       ),
            //                       //SizedBox(width: 8.0),
            //                       // Text(
            //                       //   'c',
            //                       //   style: TextStyle(color: Colors.white54),
            //                       // )
            //                     ],
            //                   ),
            //                   Text(
            //                     'PPM Ideal',
            //                     style: TextStyle(color: Colors.white54),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Widget Characteristics(
      bool btn, String characteristic, String characteristicPlant) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                btn = !btn;
              });
            },
            child: Container(
              // width: 17, //ScreenUtil().setWidth(16),
              // height: 17, //ScreenUtil().setWidth(16),
              //   child: Image(
              //       image: isTrue
              //           ? AssetImage('images/pupuk.jpeg')
              //           : AssetImage('images/bayam.jpeg')),
              // ),
              child: Icon(
                btn ? Icons.radio_button_unchecked : Icons.radio_button_checked,
                size: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
                text: '$characteristic : $characteristicPlant',
                style: TextStyle(
                    color: black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal)),
          ),
          //),
        ),
      ],
    );
  }
}

// class DetailsScreen extends StatelessWidget {
//   List<String> selectedSizes = <String>[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: greenColor,
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(32.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   color: Colors.white,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 // Text('MyHydroponics',
//                 //     style: TextStyle(
//                 //         color: Colors.white,
//                 //         letterSpacing: 1.1,
//                 //         fontSize: 22.0)),
//                 SizedBox(height: 15.0),
//                 Container(
//                   width: 200.0,
//                   child: Text(
//                     'About My Plant',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 48.0),
//                   ),
//                 ),

//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: <Widget>[
//                 //     Checkbox(
//                 //         value: selectedSizes.contains('S'),
//                 //         onChanged: (value) => changeSelectedSize('S')),
//                 //     Text('S'),
//                 //     SizedBox(height: 42.0),
//                 //     Checkbox(
//                 //         value: selectedSizes.contains('M'),
//                 //         onChanged: (value) => changeSelectedSize('M')),
//                 //     Text('M'),
//                 //     SizedBox(height: 42.0),
//                 //     Checkbox(
//                 //         value: selectedSizes.contains('L'),
//                 //         onChanged: (value) => changeSelectedSize('L')),
//                 //     Text('L'),
//                 //     SizedBox(height: 42.0),
//                 //     Checkbox(
//                 //         value: selectedSizes.contains('XL'),
//                 //         onChanged: (value) => changeSelectedSize('XL')),
//                 //     Text('XL'),
//                 //   ],
//                 // ),

//                 SizedBox(height: 42.0),
//                 itemRow(Icons.check_box_outline_blank, 'water', 'every 7 days'),
//                 SizedBox(height: 22.0),
//                 itemRow(Icons.check_box_outline_blank, 'Humidity', 'up to 82%'),
//                 SizedBox(height: 22.0),
//                 itemRow(Icons.check_box_outline_blank, 'Size', '38" - 48"tdll'),
//               ],
//             ),
//           ),
//           SizedBox(height: 32.0),
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 48.0),
//           //   child: Container(
//           //     height: 60.0,
//           //     decoration: BoxDecoration(
//           //         color: darkGreenColor,
//           //         borderRadius: BorderRadius.only(
//           //             topLeft: Radius.circular(32.0),
//           //             bottomLeft: Radius.circular(32.0))),
//           //     child: Row(
//           //       children: <Widget>[
//           //         SizedBox(width: 20.0),
//           //         Icon(Icons.add, color: Colors.white, size: 24.0),
//           //         SizedBox(width: 40.0),
//           //         Text(
//           //           'Delivery Information',
//           //           style: TextStyle(
//           //               color: Colors.white,
//           //               fontSize: 22.0,
//           //               fontWeight: FontWeight.w500),
//           //         )
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           // SizedBox(height: 32.0),
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 48.0),
//           //   child: Container(
//           //     height: 60.0,
//           //     decoration: BoxDecoration(
//           //         color: darkGreenColor,
//           //         borderRadius: BorderRadius.only(
//           //             topLeft: Radius.circular(32.0),
//           //             bottomLeft: Radius.circular(32.0))),
//           //     child: Row(
//           //       children: <Widget>[
//           //         SizedBox(width: 20.0),
//           //         Icon(Icons.add, color: Colors.white, size: 24.0),
//           //         SizedBox(width: 40.0),
//           //         Text(
//           //           'Return Policy',
//           //           style: TextStyle(
//           //               color: Colors.white,
//           //               fontSize: 22.0,
//           //               fontWeight: FontWeight.w500),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           //       Spacer(),
//           //       Container(
//           //         height: 80.0,
//           //         child: Row(
//           //           children: <Widget>[
//           //             Container(
//           //               width: MediaQuery.of(context).size.width / 2,
//           //               child: Icon(
//           //                 Icons.arrow_drop_down,
//           //                 color: Colors.white,
//           //               ),
//           //             ),
//           //             Container(
//           //                 height: 80.0,
//           //                 width: MediaQuery.of(context).size.width / 2,
//           //                 decoration: BoxDecoration(
//           //                     color: Color(0xff2c2731),
//           //                     borderRadius:
//           //                         BorderRadius.only(topLeft: Radius.circular(48.0))),
//           //                 child: Row(
//           //                   mainAxisAlignment: MainAxisAlignment.center,
//           //                   children: <Widget>[
//           //                     Icon(
//           //                       Icons.add_shopping_cart,
//           //                       color: Colors.white,
//           //                     ),
//           //                     SizedBox(
//           //                       width: 6.0,
//           //                     ),
//           //                     Text(
//           //                       'add to cart',
//           //                       style: TextStyle(color: Colors.white),
//           //                     )
//           //                   ],
//           //                 ))
//           //           ],
//           //         ),
//           //       )
//         ],
//       ),
//     );
//   }

//   itemRow(icon, name, title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(
//               icon,
//               color: Colors.white,
//             ),
//             SizedBox(width: 6.0),
//             Text(
//               name,
//               style: TextStyle(color: Colors.white, fontSize: 20.0),
//             )
//           ],
//         ),
//         Text(title, style: TextStyle(color: Colors.white54, fontSize: 20.0))
//       ],
//     );
//   }
// }

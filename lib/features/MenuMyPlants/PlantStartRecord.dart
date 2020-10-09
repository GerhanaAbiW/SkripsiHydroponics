import 'package:flutter/material.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsList.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);
var productImage =
    'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/4/4/67339064/67339064_0e9a5822-c3db-49fb-be1a-ea1f3ad177e4_336_336.jpg';
//'https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png';

class PlantStartRecord extends StatefulWidget {
  @override
  _PlantStartRecordState createState() => _PlantStartRecordState();
}

class _PlantStartRecordState extends State<PlantStartRecord> {
  @override
  bool mediaSemai = true;
  bool waktuSemai = true;
  bool jenisPupuk = true;
  bool dosisPupuk = true;
  bool waktuPupuk = true;
  bool waktuPanen = true;
  bool phIdeal = true;
  bool ppmIdeal = true;
  Widget build(BuildContext context) {
    return Scaffold(
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
                                child: Text('Bayam',
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
                                productImage,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      mediaSemai = !mediaSemai;
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
                                      mediaSemai
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'Media Semai : Rockwoll',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      waktuSemai = !waktuSemai;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      waktuSemai
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'Waktu Semai : 15 - 20 Hari',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jenisPupuk = !jenisPupuk;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      jenisPupuk
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'Jenis Pupuk : Urea, TSP, dan KCL',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      dosisPupuk = !dosisPupuk;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      dosisPupuk
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'Dosis Pupuk : 1 Sendok Makan',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      waktuPupuk = !waktuPupuk;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      waktuPupuk
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text:
                                          'Waktu Pupuk : 20, 30, 40 Hari Setelah Tanam',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      waktuPanen = !waktuPanen;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      waktuPanen
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text:
                                          'Waktu Panen : 2,5 - 3 Bulan (75 - 90 Hari',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ppmIdeal = !ppmIdeal;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      ppmIdeal
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'PPM Ideal : 1750 - 2100',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      phIdeal = !phIdeal;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      phIdeal
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
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
                                      text: 'PH Ideal : 6,5 - 7,0',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {},
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

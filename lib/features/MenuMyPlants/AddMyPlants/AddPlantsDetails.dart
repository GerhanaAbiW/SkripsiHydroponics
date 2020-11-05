import 'package:flutter/material.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsList.dart';
import 'package:hydroponics/features/Profile/ProfileViewModel.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);
var productImage =
    'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/4/4/67339064/67339064_0e9a5822-c3db-49fb-be1a-ea1f3ad177e4_336_336.jpg';

class MyPlantsDetail extends StatefulWidget {
  @override
  _MyPlantsDetailState createState() => _MyPlantsDetailState();
}

class _MyPlantsDetailState extends State<MyPlantsDetail> {
  List<ListProfileSection> listSection = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection(
        "Media Semai : Rockwoll", Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection(
        "Waktu Semai : 15 - 20 Hari", Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection("Jenis Pupuk : Urea, TSP, dan KCL",
        Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection(
        "Dosis Pupuk : 1 Sendok Makan", Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection("Waktu Pupuk : 20, 30, 40 Hari Setelah Tanam",
        Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection("Waktu Panen : 2,5 - 3 Bulan (75 - 90 Hari)",
        Icons.ac_unit, darkGreenColor, null));
  }

  createSection(String title, IconData icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greenColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(108.0)),
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
                                padding: EdgeInsets.fromLTRB(20, 0, 60, 10),
                                child: Text('Kangkung',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: greenColor,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.network(
                                productImage,
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
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
                          SizedBox(
                            height: 10,
                          ),
                          new Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: buildListView(),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Spacer(
                            flex: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  changeScreenReplacement(
                                      context, MyPlantsList());
                                },
                                backgroundColor: greenColor,
                                child: Icon(Icons.add_circle),
                              ),
                              // Container(
                              //   // height: MediaQuery.of(context).size.height / 2,
                              //   // width: MediaQuery.of(context).size.width / 2.5,
                              //   child: Image.network(
                              //     productImage,
                              //     height: 30,
                              //     width: 30,
                              //     fit: BoxFit.cover,
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_upward,
                          size: (15),
                          color: white,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("Tekan Untuk Tanam",
                            style: TextStyle(
                                color: white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    // Text('Must be Considered',
                    //     style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '6,5 - 7,0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  //SizedBox(width: 8.0),
                                  // Text(
                                  //   'ml',
                                  //   style: TextStyle(color: Colors.white54),
                                  // )
                                ],
                              ),
                              Text(
                                'PH Ideal',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '1750 - 2100',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  //SizedBox(width: 8.0),
                                  // Text(
                                  //   'c',
                                  //   style: TextStyle(color: Colors.white54),
                                  // )
                                ],
                              ),
                              Text(
                                'PPM Ideal',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          if (listSection.widget != null) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => listSection.widget));
          }
          if (listSection.title == "Logout") {
            // _showDialog();
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 12),
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: listSection.color),
                  child: Icon(
                    listSection.icon,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                flex: 8,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    listSection.title,
                    style: CustomTextStyle.textFormFieldMedium,
                  ),
                ),
                flex: 84,
              ),
              // Spacer(
              //   flex: 1,
              // ),
              // Icon(
              //   Icons.navigate_next,
              //   color: Colors.grey.shade500,
              // )
            ],
          ),
        ),
      );
    });
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

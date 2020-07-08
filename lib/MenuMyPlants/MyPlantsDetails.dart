import 'package:flutter/material.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);
var productImage =
    'https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png';

class MyPlantsDetail extends StatefulWidget {
  @override
  _MyPlantsDetailState createState() => _MyPlantsDetailState();
}

class _MyPlantsDetailState extends State<MyPlantsDetail> {
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
                          //SizedBox(height: 8.0),
                          // Container(
                          //   width: 300.0,
                          //   child: Text(
                          //     'My Plant',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold, fontSize: 32.0),
                          //   ),
                          // ),
                          // SizedBox(height: 12.0),
                          // Text(
                          //   'Make A Fresh Vegetables with Technology',
                          //   style: TextStyle(color: Colors.black45),
                          // ),
                          SizedBox(height: 12.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text('Kangkung',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: greenColor,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen()));
                                },
                                backgroundColor: greenColor,
                                child: Icon(Icons.add_circle),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Image.network(
                                  productImage,
                                  fit: BoxFit.cover,
                                ),
                              )
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
                    Text('Must be Considered',
                        style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 100.0,
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
                                    '250',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'ml',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                              Text(
                                'water',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
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
                                    '18',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'c',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                              Text(
                                'Sunshine',
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
}

class DetailsScreen extends StatelessWidget {
  List<String> selectedSizes = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Text('MyHydroponics',
                //     style: TextStyle(
                //         color: Colors.white,
                //         letterSpacing: 1.1,
                //         fontSize: 22.0)),
                SizedBox(height: 15.0),
                Container(
                  width: 200.0,
                  child: Text(
                    'About My Plant',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Checkbox(
                //         value: selectedSizes.contains('S'),
                //         onChanged: (value) => changeSelectedSize('S')),
                //     Text('S'),
                //     SizedBox(height: 42.0),
                //     Checkbox(
                //         value: selectedSizes.contains('M'),
                //         onChanged: (value) => changeSelectedSize('M')),
                //     Text('M'),
                //     SizedBox(height: 42.0),
                //     Checkbox(
                //         value: selectedSizes.contains('L'),
                //         onChanged: (value) => changeSelectedSize('L')),
                //     Text('L'),
                //     SizedBox(height: 42.0),
                //     Checkbox(
                //         value: selectedSizes.contains('XL'),
                //         onChanged: (value) => changeSelectedSize('XL')),
                //     Text('XL'),
                //   ],
                // ),

                SizedBox(height: 42.0),
                itemRow(Icons.check_box_outline_blank, 'water', 'every 7 days'),
                SizedBox(height: 22.0),
                itemRow(Icons.check_box_outline_blank, 'Humidity', 'up to 82%'),
                SizedBox(height: 22.0),
                itemRow(Icons.check_box_outline_blank, 'Size', '38" - 48"tdll'),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          // Padding(
          //   padding: const EdgeInsets.only(left: 48.0),
          //   child: Container(
          //     height: 60.0,
          //     decoration: BoxDecoration(
          //         color: darkGreenColor,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(32.0),
          //             bottomLeft: Radius.circular(32.0))),
          //     child: Row(
          //       children: <Widget>[
          //         SizedBox(width: 20.0),
          //         Icon(Icons.add, color: Colors.white, size: 24.0),
          //         SizedBox(width: 40.0),
          //         Text(
          //           'Delivery Information',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 22.0,
          //               fontWeight: FontWeight.w500),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 32.0),
          // Padding(
          //   padding: const EdgeInsets.only(left: 48.0),
          //   child: Container(
          //     height: 60.0,
          //     decoration: BoxDecoration(
          //         color: darkGreenColor,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(32.0),
          //             bottomLeft: Radius.circular(32.0))),
          //     child: Row(
          //       children: <Widget>[
          //         SizedBox(width: 20.0),
          //         Icon(Icons.add, color: Colors.white, size: 24.0),
          //         SizedBox(width: 40.0),
          //         Text(
          //           'Return Policy',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 22.0,
          //               fontWeight: FontWeight.w500),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //       Spacer(),
          //       Container(
          //         height: 80.0,
          //         child: Row(
          //           children: <Widget>[
          //             Container(
          //               width: MediaQuery.of(context).size.width / 2,
          //               child: Icon(
          //                 Icons.arrow_drop_down,
          //                 color: Colors.white,
          //               ),
          //             ),
          //             Container(
          //                 height: 80.0,
          //                 width: MediaQuery.of(context).size.width / 2,
          //                 decoration: BoxDecoration(
          //                     color: Color(0xff2c2731),
          //                     borderRadius:
          //                         BorderRadius.only(topLeft: Radius.circular(48.0))),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: <Widget>[
          //                     Icon(
          //                       Icons.add_shopping_cart,
          //                       color: Colors.white,
          //                     ),
          //                     SizedBox(
          //                       width: 6.0,
          //                     ),
          //                     Text(
          //                       'add to cart',
          //                       style: TextStyle(color: Colors.white),
          //                     )
          //                   ],
          //                 ))
          //           ],
          //         ),
          //       )
        ],
      ),
    );
  }

  itemRow(icon, name, title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        Text(title, style: TextStyle(color: Colors.white54, fontSize: 20.0))
      ],
    );
  }
}

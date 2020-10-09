import 'package:flutter/material.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsList.dart';
import 'package:hydroponics/features/Profile/ProfileViewModel.dart';

var greenColor = Color(0xFF8BC34A);
var darkGreenColor = Color(0xFF689F38);
var productImage =
    'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/4/4/67339064/67339064_0e9a5822-c3db-49fb-be1a-ea1f3ad177e4_336_336.jpg';

class MyPlantsRecordDetail extends StatefulWidget {
  @override
  _MyPlantsRecordDetailState createState() => _MyPlantsRecordDetailState();
}

class _MyPlantsRecordDetailState extends State<MyPlantsRecordDetail> {
  List<ListProfileSection> listSection = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(
        createSection("Media Semai : -", Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection(
        "Waktu Semai : 15 - 20 Hari", Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection("Jenis Pupuk : Urea, TSP, dan KCL",
        Icons.ac_unit, darkGreenColor, null));
    listSection.add(createSection(
        "Dosis Pupuk : 1 Sendok Makan", Icons.ac_unit, darkGreenColor, null));
    listSection.add(
        createSection("Waktu Pupuk : -", Icons.ac_unit, darkGreenColor, null));
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
                                padding: EdgeInsets.fromLTRB(40, 0, 60, 10),
                                child: Text('Bayam',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: greenColor,
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
                          Text("Hasil Record Anda :",
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
                      // Column(
                      //   children: <Widget>[
                      // Spacer(
                      //   flex: 5,
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     FloatingActionButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     MyPlantsList()));
                      //       },
                      //       backgroundColor: greenColor,
                      //       child: Icon(Icons.add_circle),
                      //     ),
                      //   ],
                      // ),
                      //   ],
                      // ),
                      //SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              // flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     // Icon(
                    //     //   Icons.arrow_upward,
                    //     //   size: (15),
                    //     //   color: white,
                    //     // ),
                    //     SizedBox(
                    //       width: 2,
                    //     ),
                    //     // Text("Tekan Untuk Tanam",
                    //     //     style: TextStyle(
                    //     //         color: white,
                    //     //         fontSize: 14.0,
                    //     //         fontWeight: FontWeight.normal)),
                    //   ],
                    // ),
                    // Text('Must be Considered',
                    //     style: TextStyle(color: Colors.white)),
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
                                    '6,5 - 7,0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
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

//import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/AddPlant.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsDetails.dart';
import 'package:hydroponics/features/MenuMyPlants/PlantListFromAdmin.dart';

//import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MyPlantsList extends StatefulWidget {
  @override
  _MyPlantsListState createState() => _MyPlantsListState();
}

class _MyPlantsListState extends State<MyPlantsList> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8BC34A),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                    width: 125.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyPlantsDetail()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Record  ",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          Icon(Icons.schedule, color: Colors.white)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('List',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Plants',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: AnimationLimiter(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              //duration: const Duration(milliseconds: 3000),
                              // child: SlideAnimation(
                              // verticalOffset: 100.0,
                              child: Slidable(
                                key: ValueKey(index),
                                actionPane: SlidableDrawerActionPane(),
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: "Update",
                                    color: Colors.grey.shade300,
                                    icon: Icons.edit,
                                    closeOnTap: false,
                                    onTap: () {},
                                  ),
                                  IconSlideAction(
                                    caption: "Delete",
                                    color: Colors.red.shade300,
                                    icon: Icons.edit,
                                    closeOnTap: true,
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Delete Successfull",
                                          toastLength: Toast.LENGTH_SHORT,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white);
                                    },
                                  ),
                                ],
                                dismissal: SlidableDismissal(
                                  child: SlidableDrawerDismissal(),
                                ),
                                child: YourListChild(
                                  //imgPath: 'images/bayam.jpeg',
                                  foodName: 'Kangkung',
                                  price: '7 Hari',
                                  // ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              changeScreen(context, PlantListFromAdmin());
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 7),
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: const Alignment(0.7, -0.5),
                  end: const Alignment(0.6, 0.5),
                  colors: [
                    Color(0xFF8BC34A),
                    Color(0xFF70d88b),
                  ],
                ),
              ),
              child: Icon(Icons.add_circle, size: 30),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF8BC34A),
        child: Container(
          height: 50,
          color: Color(0xFF8BC34A),
        ),
      ),
    );
  }
}

class YourListChild extends StatelessWidget {
  final imgPath;
  final foodName;
  final price;
  final plantPicture;

  YourListChild({this.imgPath, this.foodName, this.price, this.plantPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 9,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Card(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyPlantsDetail()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                    Container(
                      width: 60, //ScreenUtil().setWidth(60),
                      height: 60, //ScreenUtil().setWidth(60),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                      child:
                          // plantPicture != null
                          //     ? ClipRRect(
                          //         borderRadius: BorderRadius.circular(
                          //             44), //ScreenUtil().setWidth(44)),
                          //         child: Image.network(
                          //           plantPicture,
                          //           fit: BoxFit.fitHeight,
                          //           height: 60, //ScreenUtil().setWidth(60),
                          //         ),
                          //       )
                          //     :

                          Image.asset("images/plant.png"),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Hero(
                    //     tag: imgPath,
                    //     child: CircleAvatar(
                    //       radius: 30,
                    //       backgroundImage: ExactAssetImage(imgPath),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodName,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(price,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey))
                          ]),
                    )
                  ])),
                ],
              ))),
    );
  }
}

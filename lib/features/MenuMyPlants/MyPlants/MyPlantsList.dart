//import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantList.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsCard.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/ListRecordPlant.dart';
import 'package:provider/provider.dart';

class MyPlantsList extends StatefulWidget {
  @override
  _MyPlantsListState createState() => _MyPlantsListState();
}

class _MyPlantsListState extends State<MyPlantsList> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF8BC34A),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    changeScreen(context, DashBoard());
                  },
                ),
                Container(
                    width: 125.0,
                    child: InkWell(
                      onTap: () {
                        changeScreen(
                            context,
                            ListRecordPlant(
                             // list: userProvider.userModel.myPlantsRecord,
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Record ",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Icons.schedule, color: Colors.white)),
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
          SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height - 200.0,
            //height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
            ),
            child: ListView(
              primary: false,
              //padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 250.0,
                    child: AnimationLimiter(
                      child: ListView.builder(
                          itemCount: userProvider.userModel.myPlant.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              //duration: const Duration(milliseconds: 3000),
                              // child: SlideAnimation(
                              // verticalOffset: 100.0,
                                child: MyPlantListCard(
                                  myPlantsModel:
                                      userProvider.userModel.myPlant[index],
                                  // ),
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
              changeScreen(context, AddMyPlantList());
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
    );
  }
}

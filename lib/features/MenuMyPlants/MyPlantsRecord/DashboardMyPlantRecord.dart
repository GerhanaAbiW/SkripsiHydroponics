import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/features/MenuLearning/LearningArticle/LearningArticleDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/ListFailPlantRecord.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/ListHarvestPlantRecord.dart';

class DashboardMyplantRecord extends StatefulWidget {
  @override
  _DashboardMyplantRecordState createState() => _DashboardMyplantRecordState();
}

class _DashboardMyplantRecordState extends State<DashboardMyplantRecord> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "My Plant Record",
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
            backgroundColor: darkBlueColor,
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.blue[900],
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                  // color: Colors.lightBlue[900],
                    gradient: LinearGradient(
                        colors: [Colors.lightBlue[900], Colors.blue[200]]),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.lightBlue[900],
                        ))),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Harvest",
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Crop Failure",
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListRecordPlant(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListFailPlantRecord(),
            )
          ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuLearning/LearningArticle/LearningArticleDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/ListFailPlantRecord.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/ListHarvestPlantRecord.dart';
import 'package:provider/provider.dart';

class DashboardMyplantRecord extends StatefulWidget {
  @override
  _DashboardMyplantRecordState createState() => _DashboardMyplantRecordState();
}

class _DashboardMyplantRecordState extends State<DashboardMyplantRecord> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).reloadUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Plant Record",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
            backgroundColor: Color(0xFF8BC34A),
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.greenAccent,
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.lightGreen[600],
                      Colors.lightGreenAccent[200]
                    ]),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.green[900],
                        ))),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Harvest",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Crop Failure",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListHarvestPlantRecord(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListFailPlantRecord(),
            )
          ]),
        ));
  }
}

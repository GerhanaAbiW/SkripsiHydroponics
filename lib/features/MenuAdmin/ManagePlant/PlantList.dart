import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantCard.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantSearchScreen.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantUpdate.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantCard.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:provider/provider.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
            child: SearchPlant(
          widget: PlantSearchScreen(),
        )),
        Container(
            height: MediaQuery.of(context).size.height - 300.0,
            //height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
            ),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: plantProvider.plants.length == 0 ||
                    plantProvider.plants.length == null
                ? Padding(
                    padding: const EdgeInsets.all(125.0),
                    child: Image.asset('images/not_found.png'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: plantProvider.plants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: PlantCard(
                          plant: plantProvider.plants[index],
                        ),
                      );
                      // return Card(
                      //     elevation: 10.0,
                      //     child: InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).push(MaterialPageRoute(
                      //             builder: (context) => MyPlantsDetail()));
                      //       },
                      //       child: ListTile(
                      //         leading: CircleAvatar(
                      //           radius: 30,
                      //           backgroundImage:
                      //               ExactAssetImage("images/plant.png"),
                      //         ),
                      //         title: Text(title[index],
                      //             style: TextStyle(fontSize: 14)),
                      //         subtitle:
                      //             Text(desc[index], style: TextStyle(fontSize: 10)),
                      //       ),
                      //     ));
                    },
                  )),
      ],
    );
  }
}

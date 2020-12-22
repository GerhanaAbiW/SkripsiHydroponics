import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/PlantService.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantCard.dart';
import 'package:hydroponics/features/MenuAdmin/ManagePlant/PlantUpdate.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantCard.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderDetails.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:provider/provider.dart';

class PlantSearchScreen extends StatefulWidget {
  @override
  _PlantSearchScreenState createState() => _PlantSearchScreenState();
}

class _PlantSearchScreenState extends State<PlantSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Search",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: Column(
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              child: SearchPlant(
            widget: PlantSearchScreen(),
          )),
          Expanded(
            child: Container(

                //height: MediaQuery.of(context).size.height / 2,
                //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: plantProvider.plantsSearched.length < 1
                    ? Padding(
                        padding: const EdgeInsets.all(125.0),
                        child: Image.asset('images/not_found.png'),
                      )
                    : Container(
                  height: MediaQuery.of(context).size.height,
                  // //height: 20,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
                  // ),
                  width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: plantProvider.plantsSearched.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              child: PlantCard(
                                plant: plantProvider.plantsSearched[index],
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
                        ),
                    )),
          ),
        ],
      ),
    );
  }
}

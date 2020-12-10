import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantCard.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:provider/provider.dart';

class AddMyPlantSearchScreen extends StatefulWidget {
  @override
  _AddMyPlantSearchScreenState createState() => _AddMyPlantSearchScreenState();
}

class _AddMyPlantSearchScreenState extends State<AddMyPlantSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF8BC34A),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Choose Your Plant',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: SearchPlant(
              widget: AddMyPlantSearchScreen(),
            ),
          ),
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
              child: plantProvider.plantsSearched.length < 1
                  ? Padding(
                      padding: const EdgeInsets.all(125.0),
                      child: Image.asset('images/not_found.png'),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: plantProvider.plantsSearched.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: AddMyPlantCard(
                            plant: plantProvider.plantsSearched[index],
                          ),
                        );
                      },
                    )),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuMyPlants/Widget/WidgetListRecordDate.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';

class ListRecordDatePlant extends StatefulWidget {
  @override
  _ListRecordDatePlantState createState() => _ListRecordDatePlantState();
}

class _ListRecordDatePlantState extends State<ListRecordDatePlant> {
  @override
  Widget build(BuildContext context) {
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
          'Plant Record',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: SearchListAddPlantWidget(),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 200.0,
              //height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              ),
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: WidgetListRecordDate(
                      date: 'Januari 2020',
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

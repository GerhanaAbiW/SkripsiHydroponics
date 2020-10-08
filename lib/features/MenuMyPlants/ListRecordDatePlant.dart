import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/ListRecordDetailPlant.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsDetails.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';
import 'package:hydroponics/features/Widget/SearchPlantRecordDate.dart';

class RecordDatePlant extends StatefulWidget {
  @override
  _RecordDatePlantState createState() => _RecordDatePlantState();
}

class _RecordDatePlantState extends State<RecordDatePlant> {
  //List<String> images;
  List<String> title = [
    'Februari 2020',
    'Maret 2020',
    'April 2020',
    'Mei 2020',
    'Juni 2020'
  ];

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
      body: Column(
        children: <Widget>[
          Container(
            child: SearchLPlantRecordDateWidget(),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 10.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListRecordDetailPlant()));
                        },
                        child: ListTile(
                          // leading: CircleAvatar(
                          //   radius: 30,
                          //   backgroundImage: ExactAssetImage("images/plant.png"),
                          // ),
                          title: Text(title[index],
                              style: TextStyle(fontSize: 14)),
                          // subtitle:
                          //     Text(phones[index], style: TextStyle(fontSize: 10)),
                          trailing: Icon(Icons.date_range),
                        ),
                      ));
                },
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/AddPlants/MyPlantsDetails.dart';
import 'package:hydroponics/features/MenuMyPlants/MyRecord/WidgetListRecordDetailPlant.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';
import 'package:hydroponics/features/Widget/SearchPlantRecordDate.dart';

class ListRecordDetailPlant extends StatefulWidget {
  @override
  _RecordDetailPlantState createState() => _RecordDetailPlantState();
}

class _RecordDetailPlantState extends State<ListRecordDetailPlant> {
  //List<String> images;
  // List<String> title = ['Kangkung', 'Caisim', 'Sawi', 'Kol', 'Bayam'];
  // List<String> desc = [
  //   'ppm ideal 12%, suhu ideal 34',
  //   'ppm ideal 15%, suhu ideal 53',
  //   'ppm ideal 17%, suhu ideal 22',
  //   'ppm ideal 18%, suhu ideal 49',
  //   'ppm ideal 19%, suhu ideal 47'
  // ];

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
              height: MediaQuery.of(context).size.height - 100.0,
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
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: WidgetLIstRecordDetailPlant(
                      plantName: 'Kangkung',
                      desc: 'PH ideal 12, PPM Ide..',
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
      ),
    );
  }
}

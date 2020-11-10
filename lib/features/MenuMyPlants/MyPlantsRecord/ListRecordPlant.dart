import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/CardRecordDate.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecord/CardRecordDetailPlant.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';

class ListRecordPlant extends StatefulWidget {
  final String list;
  ListRecordPlant({Key key, this.list}) : super(key: key);
  @override
  _ListRecordPlantState createState() => _ListRecordPlantState();
}

class _ListRecordPlantState extends State<ListRecordPlant> {
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
        title: widget.list=="date"?Text(
          'Plant Record',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ):Text(
          'Plant Record',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: widget.list == "date" ? ListView(
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
      ): Column(
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

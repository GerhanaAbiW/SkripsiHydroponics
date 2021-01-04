import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Models/MyPlantsRecord.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

import 'CardRecordPlant.dart';

class ListFailPlantRecord extends StatefulWidget {
  @override
  _ListFailPlantRecordState createState() => _ListFailPlantRecordState();
}

class _ListFailPlantRecordState extends State<ListFailPlantRecord> {
  List<MyPlantsRecordModel> list;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).reloadUserModel();
    list = Provider.of<UserProvider>(context, listen: false).userModel.myFailPlantsRecord;
    list.sort((a, b) => a.date.compareTo(b.date));
  }
  @override
  Widget build(BuildContext context) {
    //final userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height / 2,
          //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: list.length == 0 || list.length == null
              ? Padding(
            padding: const EdgeInsets.all(125.0),
            child: Image.asset('images/not_found.png', width: 20, height: 20))
              : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              bool isHeader = false;
              if(index>0){
                isHeader = list[index].date == list[index-1].date;
              }
              return AnimationConfiguration.staggeredList(
                position: index,
                child: WidgetLIstRecordDetailPlant(
                  model: list[index],
                  header: isHeader,
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

    );
  }
}

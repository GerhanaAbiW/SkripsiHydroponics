import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/features/Widget/SearchListAddPlant.dart';

class PlantListFromAdmin extends StatefulWidget {
  @override
  _PlantListFromAdminState createState() => _PlantListFromAdminState();
}

class _PlantListFromAdminState extends State<PlantListFromAdmin> {
   //List<String> images;
   List<String> title = ['ichigo', 'niigo', 'sango', 'yongo', 'hakko'];
   List<String> phones= [
   '(021)678392',
   '(021)678334',
   '(021)672414',
   '(021)678390',
   '(021)679992'
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydroasik',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: SearchListAddPlantWidget(),
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
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: ExactAssetImage("images/plant.png"),
                      ),
                      title: Text(title[index], style: TextStyle(fontSize: 14)),
                      subtitle: Text(phones[index], style: TextStyle(fontSize: 10)),
                      trailing: Icon(Icons.tag_faces),
                    ),
                  );
                },)
          ),
        ],
      ),
    );
  }
}








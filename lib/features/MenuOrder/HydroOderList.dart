import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuOrder/HydroOrderCustomDetail.dart';
import 'package:hydroponics/features/MenuOrder/HydroOrderDetail.dart';

var blueOrder = Color(0xFF03A9F4);
class HydroList {
  String type;
  String image;
  String price;
  Widget widget;



  HydroList(this.type, this.image, this.price, this.widget);
}
class HydroOrderList extends StatefulWidget {
  @override
  _HydroOrderListState createState() => _HydroOrderListState();
}

class _HydroOrderListState extends State<HydroOrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }
  List<HydroList> listSection = new List();
  void createListItem() {
    listSection.add(createSection("Small", "images/bayam.jpeg","Rp.10.000",HydroOrderDetail()));
    listSection.add(createSection("Medium", "images/bayam.jpeg","Rp.10.000",HydroOrderDetail()));
    listSection.add(createSection("Large", "images/bayam.jpeg","Rp.10.000",HydroOrderDetail()));
    listSection.add(createSection("Custom","images/bayam.jpeg","Rp.10.000",HydroOrderCustomDetail()));
  }
  createSection(String type, String image, String price, Widget widget) {
    return HydroList(type,image, price, widget);
  }
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
        backgroundColor: blueOrder,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydro Order',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: CardListOrder(
        list: listSection,
      )
  
    );
  }
}
class CardListOrder extends StatelessWidget {
 final List<HydroList> list;
  CardListOrder({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              child: GestureDetector(
                onTap: ()=>changeScreen(context, list[index].widget),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: ExactAssetImage(list[index].image),
                  ),
                  title: Text(list[index].type,  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  )),
                  subtitle: Text(list[index].price, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontFamily: 'Montserrat',
                      fontSize: 10)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blueAccent,),
                ),
              ),
            );
          },)
    );
  }
}



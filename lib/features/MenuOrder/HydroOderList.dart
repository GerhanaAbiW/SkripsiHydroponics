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
  String area;
  String price;
  Widget widget;

  HydroList(this.type, this.image, this.area, this.price, this.widget);
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
    listSection.add(createSection("Small", "images/no-image-icon.png",
        "10x20x30", "Rp.10.000", HydroOrderDetail()));
    listSection.add(createSection("Medium", "images/bayam.jpeg", "10x50x30",
        "Rp.10.000", HydroOrderDetail()));
    listSection.add(createSection("Large", "images/bayam.jpeg", "10x20x90",
        "Rp.10.000", HydroOrderDetail()));
    listSection.add(createSection("Custom", "images/bayam.jpeg", "10x20x20",
        "Rp.10.000", HydroOrderCustomDetail()));
  }

  createSection(
      String type, String image, String area, String price, Widget widget) {
    return HydroList(type, image, area, price, widget);
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
        elevation: 10,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Hydro Order',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ini kasi text apa kek"),
          ),
          SizedBox(height: 16),
          CardListOrder(
            list: listSection,
          ),
        ],
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height / 6.5,
              child: Card(
                elevation: 20.0,
                child: GestureDetector(
                  onTap: () => changeScreen(context, list[index].widget),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0), //or 15.0
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5.5,
                        width: MediaQuery.of(context).size.width / 5.5,
                        color: blueOrder,
                        child: Image(
                          image: AssetImage(
                            list[index].image,
                          ),
                          fit: BoxFit
                              .cover, //Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                        ),
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 10,
                    //   backgroundImage: ExactAssetImage(list[index].image),
                    // ),

                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].type,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(list[index].area,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blueAccent,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(list[index].price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontFamily: 'Montserrat',
                                      fontSize: 10)),
                            ),
                          ]),
                    ),

                    // title: Padding(
                    //   padding: const EdgeInsets.only(bottom: 20, top: 10),
                    //   child: Text(list[index].type,
                    //       style: TextStyle(
                    //         fontFamily: 'Montserrat',
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.blueAccent,
                    //       )),
                    // ),

                    // subtitle: Padding(
                    //   padding: const EdgeInsets.only(top: 0.0),
                    //   child: Text(list[index].price,
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.blueAccent,
                    //           fontFamily: 'Montserrat',
                    //           fontSize: 10)),
                    // ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

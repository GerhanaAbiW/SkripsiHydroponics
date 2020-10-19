import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/features/MenuAdmin/AddArticle/AddArticle.dart';
import 'package:hydroponics/features/MenuAdmin/AddPlant/AddPlant.dart';
import 'package:hydroponics/features/MenuAdmin/AddProduct.dart';
import 'package:hydroponics/features/MenuAdmin/AddVideo/AddVideo.dart';
import 'package:hydroponics/features/MenuAdmin/NewDashboard.dart';

class DrawerItem {
  String title;
  IconData icon;
  IconThemeData iconThemeData;

  DrawerItem(this.title, this.icon, this.iconThemeData);
}

class MenuAdmin extends StatefulWidget {
  @override
  _MenuAdminState createState() => _MenuAdminState();
  final drawerItem = [
    DrawerItem("Dashbord", Icons.home, IconThemeData(color: Colors.black)),
    DrawerItem("Add Product", Icons.card_giftcard, IconThemeData(color: Colors.redAccent)),
    DrawerItem("Add Artcile", Icons.border_color, IconThemeData(color: Colors.black)),
    DrawerItem("Add Video", Icons.videocam, IconThemeData(color: Colors.black)),
    DrawerItem("Add Plant", Icons.settings, IconThemeData(color: Colors.black)),
    DrawerItem("5", Icons.live_help, IconThemeData(color: Colors.black)),
  ];
}

class _MenuAdminState extends State<MenuAdmin> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return NewAdminDashboard();
      case 1:
        return AddProducts();
      case 2:
        return AddArticleView();
      case 3:
        return AddVideoView();
      case 4:
        return AddPlantView();
      case 5:
        return AddArticleView();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItem.length; i++) {
      var d = widget.drawerItem[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        //elevation: 0.0,
        //automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.drawerItem[_selectedDrawerIndex].title,
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      drawer: Container(
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.blue),
          child: Drawer(
              child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   child: DrawerHeader(child: new CircleAvatar()),
            //   color: Colors.tealAccent,
            // ),
            Container(child: Column(children: drawerOptions))
          ])),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

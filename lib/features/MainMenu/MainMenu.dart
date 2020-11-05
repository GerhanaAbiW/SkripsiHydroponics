import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuAdmin/Dashboard.dart';
import 'package:hydroponics/features/MenuAdmin/MainMenuAdmin.dart';
import 'package:hydroponics/features/MenuAdmin/Dashboard.dart';
import 'package:hydroponics/features/MenuLearning/Article/ArticleDetail.dart';
import 'package:hydroponics/features/MenuLearning/MenuLearning.dart';
import 'package:hydroponics/features/MenuMarket/Market.dart';
import 'package:hydroponics/features/MenuMarket/ProductDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlants/MyPlantsList.dart';
import 'package:hydroponics/features/MenuHydroOrder/Gmaps/GmapsLocation.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOderList.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with SingleTickerProviderStateMixin {
  Material MyItems(IconData icon, String heading, int color, Widget widget) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: () => changeScreen(context, widget),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style:
                            TextStyle(color: new Color(color), fontSize: 20.0),
                      ),
                    ),

                    //Icon
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
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
      body: user.userModel.role == "admin"
          ? StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              children: <Widget>[
                MyItems(
                    Icons.shopping_cart, "Market", 0xFF03A9F4, MenuMarket()),
                MyItems(Icons.shopping_basket, "Hydro Order", 0xFF03A9F4,
                    HydroOrderList()),
                MyItems(Icons.library_books, "Learning", 0xFF3F51B5,
                    MenuLearning()),
                MyItems(Icons.local_florist, "MyPlants", 0xFF7CB342,
                    MyPlantsList()),
                MyItems(Icons.account_box, "Penjual", 0xFFF4511E, MenuAdmin()),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(2, 150.0),
              ],
            )
          : StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              children: <Widget>[
                MyItems(
                    Icons.shopping_cart, "Market", 0xFF03A9F4, MenuMarket()),
                MyItems(Icons.shopping_basket, "Hydro Order", 0xFF03A9F4,
                    HydroOrderList()),
                MyItems(Icons.library_books, "Learning", 0xFF3F51B5,
                    MenuLearning()),
                MyItems(Icons.local_florist, "MyPlants", 0xFF7CB342,
                    MyPlantsList()),
                // MyItems(Icons.account_box, "Penjual", 0xFFF4511E, MenuAdmin()),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                StaggeredTile.extent(1, 150.0),
                // StaggeredTile.extent(2, 150.0),
              ],
            ),
    );
  }
}

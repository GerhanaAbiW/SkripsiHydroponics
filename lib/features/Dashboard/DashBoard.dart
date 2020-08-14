import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hydroponics/core/Router/Router_Constants.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuLearning/MenuLearning.dart';
import 'package:hydroponics/features/Widget/ButtomNavigationBar.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  // int _selectedIndex = 0;
  // PageController _pageController;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  Material MyItems(IconData icon, String heading, int color, String route) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(route),
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
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        children: <Widget>[
          MyItems(Icons.library_books, "Learning", 0xFF3F51B5, 'learning'),
          MyItems(Icons.shopping_basket, "Hydro Order", 0xFF03A9F4, "10"),
          MyItems(Icons.local_florist, "MyPlants", 0xFF7CB342, "2"),
          MyItems(Icons.shopping_cart, "Market", 0xFF03A9F4, "3"),

          // MyItems(Icons.account_box, "Admin", 0xFFF4511E, "7"),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
        ],
      ),
      bottomNavigationBar: ButtonNavgiationBar(),

      // BottomNavyBar(
      //   selectedIndex: _selectedIndex,
      //   showElevation: true, // use this to remove appBar's elevation
      //   onItemSelected: (index) => setState(() {
      //     _selectedIndex = index;
      //     _pageController.animateToPage(index,
      //         duration: Duration(milliseconds: 300), curve: Curves.ease);
      //   }),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.apps),
      //       title: Text('Home'),
      //       activeColor: Colors.red,
      //     ),
      //     BottomNavyBarItem(
      //         icon: Icon(Icons.people),
      //         title: Text('Users'),
      //         activeColor: Colors.purpleAccent),
      //     BottomNavyBarItem(
      //         icon: Icon(Icons.message),
      //         title: Text('Messages'),
      //         activeColor: Colors.pink),
      //     BottomNavyBarItem(
      //         icon: Icon(Icons.assignment),
      //         title: Text('Orders'),
      //         activeColor: Colors.blue),
      //   ],
      //)
    );
  }
}

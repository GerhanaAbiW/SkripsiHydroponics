import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MainMenu/MainMenu.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/DashboardAdminOrder.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderList.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/DashboardUserOrder.dart';
import 'package:hydroponics/features/OrderList/UserOrderList/ProductOrderUser/UserOrderList.dart';
import 'package:hydroponics/features/Profile/ProfilePage.dart';
import 'package:hydroponics/features/Widget/WhatsApps.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        body: SizedBox.expand(
          child: user.userModel.role == "user"
              ? PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    MainMenu(),
                    NewProfilePage(),
                    WhatsApps(),
                   DashboardUserOrder()
                  ],
                )
              : PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    MainMenu(),
                    NewProfilePage(),
                    WhatsApps(),
                    DashboardAdminOrder(),
                  ],
                ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: GreenTosca,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Color(0xFF689F38)),
            BottomNavyBarItem(
                icon: Icon(Icons.phone),
                title: Text('Contact Us'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Orders'),
                activeColor: Colors.blue),
          ],
        ));
  }
}

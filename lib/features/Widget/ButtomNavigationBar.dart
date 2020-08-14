import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class ButtonNavgiationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex;
    return Container(
        child: BottomNavyBar(
      selectedIndex: _selectedIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
        var _pageController;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent),
        BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
            activeColor: Colors.pink),
        BottomNavyBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Orders'),
            activeColor: Colors.blue),
      ],
    ));
  }
}

setState(Null Function() param0) {}

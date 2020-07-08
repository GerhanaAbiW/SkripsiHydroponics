import 'package:flutter/material.dart';
import 'package:hydroponics/MenuLearning/ArticleList.dart';
import 'package:hydroponics/MenuLearning/VideoList.dart';

class MenuLearning extends StatefulWidget {
  @override
  _MenuLearningState createState() => _MenuLearningState();
}

class _MenuLearningState extends State<MenuLearning> {
  final List<String> myList = [
    'images/bayam.jpeg',
    'images/bayam.jpeg',
    'images/bayam.jpeg',
    'images/bayam.jpeg',
    'images/bayam.jpeg',
  ];
  final List<String> names = ['ichigo', 'niigo', 'sango', 'yongo', 'hakko'];
  final List<String> phones = [
    '(021)678392',
    '(021)678334',
    '(021)672414',
    '(021)678390',
    '(021)679992'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.lightBlue[900],
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Learning",
              style: TextStyle(
                  color: Colors.lightBlue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.blue[900],
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightBlue[900], Colors.blue[200]]),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colors.lightBlue[900],
                        ))),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ARTICLES"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("MOVIES"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ArticleList(
                images: myList,
                title: names,
                phones: phones,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VideoList(
                images: myList,
                title: names,
                phones: phones,
              ),
            )
          ]),
        ));
  }
}

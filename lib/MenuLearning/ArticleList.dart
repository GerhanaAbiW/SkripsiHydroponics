import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  final List<String> images;
  final List<String> title;
  final List<String> phones;

  ArticleList({this.images, this.title, this.phones});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: ExactAssetImage(images[index]),
                ),
                title: Text(title[index], style: TextStyle(fontSize: 14)),
                subtitle: Text(phones[index], style: TextStyle(fontSize: 10)),
                //trailing: Icon(Icons.tag_faces),
              ),
            );
          },
        ));
  }
}

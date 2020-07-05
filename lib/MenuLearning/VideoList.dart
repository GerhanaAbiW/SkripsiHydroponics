import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final List<String> images;
  final List<String> title;
  final List<String> phones;

  VideoList({this.images, this.title, this.phones});

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
                leading: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0
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

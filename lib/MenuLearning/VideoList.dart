import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 3000),
                child: SlideAnimation(
                  verticalOffset: 100.0,
                  child: Slidable(
                    key: ValueKey(index),
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: "Update",
                        color: Colors.grey.shade300,
                        icon: Icons.edit,
                        closeOnTap: false,
                        onTap: () {},
                      ),
                      IconSlideAction(
                        caption: "Delete",
                        color: Colors.red.shade300,
                        icon: Icons.edit,
                        closeOnTap: true,
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Delete Successfull",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        },
                      ),
                    ],
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                    ),
                    child: Card(
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
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

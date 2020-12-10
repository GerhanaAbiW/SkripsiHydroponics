import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageVideo/AddVideo.dart';
import 'package:hydroponics/features/MenuAdmin/ManageVideo/VideoCard.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:hydroponics/features/Widget/SearchVideo.dart';
import 'package:provider/provider.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  String idUrl;
  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(child: SearchVideo()),
        Container(
            height: MediaQuery.of(context).size.height - 300.0,
            //height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
            ),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child:
                videoProvider.videos.length == 0 || videoProvider.videos == null
                    ? Padding(
                        padding: const EdgeInsets.all(125.0),
                        child: Image.asset('images/not_found.png'),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: videoProvider.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (videoProvider.videos[index].video != null &&
                              videoProvider.videos[index].video != "") {
                            idUrl = videoProvider.videos[index].video.substring(
                                videoProvider.videos[index].video.length - 11);
                          }
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            child: VideoCard(
                              video: videoProvider.videos[index],
                            ),
                          );
                          // return Card(
                          //     elevation: 10.0,
                          //     child: InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).push(MaterialPageRoute(
                          //             builder: (context) => MyPlantsDetail()));
                          //       },
                          //       child: ListTile(
                          //         leading: CircleAvatar(
                          //           radius: 30,
                          //           backgroundImage:
                          //               ExactAssetImage("images/plant.png"),
                          //         ),
                          //         title: Text(title[index],
                          //             style: TextStyle(fontSize: 14)),
                          //         subtitle:
                          //             Text(desc[index], style: TextStyle(fontSize: 10)),
                          //       ),
                          //     ));
                        },
                      )),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class WidgetVideoList extends StatelessWidget {
//   final List<String> images;
//   final List<String> title;
//   final List<String> phones;

//   WidgetVideoList({this.images, this.title, this.phones});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height / 2,
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//         child: AnimationLimiter(
//           child: ListView.builder(
//             itemCount: images.length,
//             itemBuilder: (BuildContext context, int index) {
//               return AnimationConfiguration.staggeredList(
//                 position: index,
//                 duration: const Duration(milliseconds: 3000),
//                 child: SlideAnimation(
//                   verticalOffset: 100.0,
//                   child: Slidable(
//                     key: ValueKey(index),
//                     actionPane: SlidableDrawerActionPane(),
//                     secondaryActions: <Widget>[
//                       IconSlideAction(
//                         caption: "Update",
//                         color: Colors.grey.shade300,
//                         icon: Icons.edit,
//                         closeOnTap: false,
//                         onTap: () {},
//                       ),
//                       IconSlideAction(
//                         caption: "Delete",
//                         color: Colors.red.shade300,
//                         icon: Icons.edit,
//                         closeOnTap: true,
//                         onTap: () {
//                           Fluttertoast.showToast(
//                               msg: "Delete Successfull",
//                               toastLength: Toast.LENGTH_SHORT,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white);
//                         },
//                       ),
//                     ],
//                     dismissal: SlidableDismissal(
//                       child: SlidableDrawerDismissal(),
//                     ),
//                     child: Card(
//                       elevation: 10.0,
//                       child: ListTile(
//                         leading: Image(
//                             image: AssetImage(images[index]),
//                             fit: BoxFit.cover,
//                             height: 75.0,
//                             width: 75.0),
//                         title:
//                             Text(title[index], style: TextStyle(fontSize: 14)),
//                         subtitle:
//                             Text(phones[index], style: TextStyle(fontSize: 10)),
//                         //trailing: Icon(Icons.tag_faces),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ));
//   }
// }

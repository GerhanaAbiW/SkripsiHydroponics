import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuLearning/ArticleDetail.dart';
import 'package:hydroponics/features/MenuLearning/VIdeoDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsRecordDetail.dart';

class WidgetVideoList extends StatelessWidget {
  final List<String> images;
  final List<String> title;
  final List<String> phones;

  WidgetVideoList({this.images, this.title, this.phones});

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
              //return AnimationConfiguration.staggeredList(
              //   position: index,
              //   duration: const Duration(milliseconds: 3000),
              // child: SlideAnimation(
              //   verticalOffset: 100.0,
              //   child: Slidable(
              //       key: ValueKey(index),
              //       actionPane: SlidableDrawerActionPane(),
              //       secondaryActions: <Widget>[
              //         IconSlideAction(
              //           caption: "Update",
              //           color: Colors.grey.shade300,
              //           icon: Icons.edit,
              //           closeOnTap: false,
              //           onTap: () {},
              //         ),
              //         IconSlideAction(
              //           caption: "Delete",
              //           color: Colors.red.shade300,
              //           icon: Icons.edit,
              //           closeOnTap: true,
              //           onTap: () {
              //             Fluttertoast.showToast(
              //                 msg: "Delete Successfull",
              //                 toastLength: Toast.LENGTH_SHORT,
              //                 backgroundColor: Colors.red,
              //                 textColor: Colors.white);
              //           },
              //         ),
              //       ],
              //       dismissal: SlidableDismissal(
              //         child: SlidableDrawerDismissal(),
              //       ),
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 9,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Card(
                    //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    elevation: 10.0,
                    child: InkWell(
                        onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoDetail()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 70, //ScreenUtil().setWidth(60),
                                  height: 60, //ScreenUtil().setWidth(60),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(),
                                  ),
                                  child:
                                      // plantPicture != null
                                      //     ? ClipRRect(
                                      //         borderRadius: BorderRadius.circular(
                                      //             44), //ScreenUtil().setWidth(44)),
                                      //         child: Image.network(
                                      //           plantPicture,
                                      //           fit: BoxFit.fitHeight,
                                      //           height: 60, //ScreenUtil().setWidth(60),
                                      //         ),
                                      //       )
                                      //     :

                                      Image.asset(images[index]),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Hero(
                              //     tag: imgPath,
                              //     child: CircleAvatar(
                              //       radius: 30,
                              //       backgroundImage: ExactAssetImage(imgPath),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(width: 10.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(title[index],
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(phones[index],
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0,
                                              color: Colors.grey))
                                    ]),
                              )
                            ])),
                          ],
                        ))),
              );
              // child: Card(
              //   elevation: 10.0,
              //   child: GestureDetector(
              //     onTap: () {
              //       changeScreen(context, ArticleDetail());
              //     },
              //     child: ListTile(
              //       leading: CircleAvatar(
              //         radius: 30,
              //         backgroundImage: ExactAssetImage(images[index]),
              //       ),
              //       title: Text(title[index],
              //           style: TextStyle(fontSize: 14)),
              //       subtitle: Text(phones[index],
              //           style: TextStyle(fontSize: 10)),
              //       //trailing: Icon(Icons.tag_faces),
              //     ),
              //   ),
              // ),
              //),
              // ),
              //);
            },
          ),
        ));
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

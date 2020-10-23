import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuLearning/Article/ArticleDetail.dart';
import 'package:hydroponics/features/MenuMyPlants/MyRecord/MyPlantsRecordDetail.dart';
import 'package:provider/provider.dart';

class WidgetArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double c_width = MediaQuery.of(context).size.width / 2;
    final articleProvider = Provider.of<ArticleProvider>(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        //padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: articleProvider.articles.length,
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
                // width: MediaQuery.of(context).size.width,
                height: 100, //MediaQuery.of(context).size.height,
                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Card(
                    //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    elevation: 10.0,
                    child: InkWell(
                        onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ArticleDetail(
                                  articleProvider.articles[index])));
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
                                    child: articleProvider
                                                .articles[index].image !=
                                            null
                                        ?
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

                                        Image.network(
                                            '${articleProvider.articles[index].image}',
                                            fit: BoxFit.fill,
                                          )
                                        : Image.asset("images/bayam.jpeg")),
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
                              SizedBox(width: 3.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      new Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                            articleProvider
                                                .articles[index].title,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      // Text(
                                      //     articleProvider.articles[index].title,
                                      //     style: TextStyle(
                                      //       fontFamily: 'Montserrat',
                                      //       fontSize: 17.0,
                                      //       fontWeight: FontWeight.bold,
                                      //     )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                            articleProvider
                                                .articles[index].date,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15.0,
                                                color: Colors.grey)),
                                      )
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

class CardArticle extends StatefulWidget {
  @override
  _CardArticleState createState() => _CardArticleState();
}

class _CardArticleState extends State<CardArticle> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

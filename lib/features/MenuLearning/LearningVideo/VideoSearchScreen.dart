import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuLearning/LearningVideo/LearningVideoDetail.dart';
import 'package:hydroponics/features/MenuLearning/SearchLearning.dart';
import 'package:provider/provider.dart';

class VideoSearchScreenUser extends StatefulWidget {
  @override
  _VideoSearchScreenUserState createState() => _VideoSearchScreenUserState();
}

class _VideoSearchScreenUserState extends State<VideoSearchScreenUser> {
  String idUrl;
  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F51B5),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Videos",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: Column(
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: SearchLearning(
              widget: VideoSearchScreenUser(),
              search: "video",
              hint: "Cari Video...",
            ),
          ),
          Expanded(
            child: Container(
                child: videoProvider.videosSearched.length < 1
                    ? Padding(
                        padding: const EdgeInsets.all(125.0),
                        child: Image.asset('images/not_found.png'),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        //height: 20,

                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height / 2,
                        //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: videoProvider.videosSearched.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (videoProvider.videosSearched[index].video !=
                                    null &&
                                videoProvider.videosSearched[index].video !=
                                    "") {
                              idUrl = videoProvider.videosSearched[index].video
                                  .substring(videoProvider
                                          .videosSearched[index].video.length -
                                      11);
                            }
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                child: Container(
                                    // width: MediaQuery.of(context).size.width,
                                    height:
                                        100, //MediaQuery.of(context).size.height / 9,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 1),
                                    child: Card(
                                      //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                                      elevation: 10.0,
                                      child: InkWell(
                                          onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LearningVideoDetail(
                                                            video: videoProvider
                                                                    .videos[
                                                                index])));
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          width: 70,
                                                          //ScreenUtil().setWidth(60),
                                                          height: 60,
                                                          //ScreenUtil().setWidth(60),
                                                          decoration:
                                                              new BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border:
                                                                Border.all(),
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

                                                              Stack(
                                                            children: <Widget>[
                                                              Image.network(
                                                                "https://img.youtube.com/vi/$idUrl/0.jpg",
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              Positioned.fill(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Image
                                                                      .asset(
                                                                          "images/play_button.png"),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      // child: Column(
                                                      //     crossAxisAlignment:
                                                      //         CrossAxisAlignment.start,
                                                      //     children: [
                                                      //       // SizedBox(
                                                      //       //   height: 10,
                                                      //       // ),
                                                      //       SizedBox(width: 3.0),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.all(8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            new Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.6,
                                                              child: Text(
                                                                  videoProvider
                                                                      .videos[
                                                                          index]
                                                                      .title,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ),
                                                            // Text(videoProvider.videos[index].title,
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
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          8.0),
                                                              child: Text(
                                                                  videoProvider
                                                                      .videos[
                                                                          index]
                                                                      .date,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          15.0,
                                                                      color: Colors
                                                                          .grey)),
                                                            )
                                                          ]),
                                                      //)
                                                      // ]//)
                                                    ),
                                                  ],
                                                ))
                                              ])),
                                    )));
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
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}

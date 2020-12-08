import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageVideo/UpdateVideo.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';



class VideoCard extends StatelessWidget {
  final Video video;
  final String idUrl;
  const VideoCard({Key key, this.video, this.idUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    VideoService _videoService = VideoService();
    return Container(
      // width: MediaQuery.of(context).size.width,
        height: 100, //MediaQuery.of(context).size.height / 9,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
        child: Card(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          elevation: 10.0,
          child: InkWell(
              onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
//              ));
                changeScreen(context, UpdateVideo(video: video,));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: [
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

                                  Stack(
                                    children: <Widget>[
                                      Image.network(
                                        "https://img.youtube.com/vi/$idUrl/0.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
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
                              padding: const EdgeInsets.all(8.0),
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
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    new Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.6,
                                      child: Text(
                                          video.title,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0),
                                      child: Text(
                                          video.date,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0,
                                              color: Colors.grey)),
                                    )
                                  ]),
                              //)
                              // ]//)
                            ),
                          ],
                        )),
                    GestureDetector(child: Icon(Icons.delete, color: Colors.red,),onTap: (){
                      _videoService.deleteVideo(video.id);
                    },)])),
        ));
  }
}

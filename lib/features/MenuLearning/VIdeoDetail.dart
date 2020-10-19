import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuLearning/Widget/WidgetArticleList.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

var blueColor = Color(0xFF3232FF);
var darkBlueColor = Color(0xFF3F51B5);
var lightblue = Color(0xFFadd8e6);

class VideoDetail extends StatefulWidget {
  Video video;

  VideoDetail(this.video);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  TextStyle biggerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle smallerText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.video.video),
      // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hydro Video',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              backScreen(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: darkBlueColor
                //     gradient: LinearGradient(
                //   colors: [
                //     Color(0xff19803d),
                //     Color(0xff34ff7c),
                //   ],
                // )
                ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: darkBlueColor,
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
        body: SafeArea(
            child: (Container(
          width: width,
          decoration: BoxDecoration(color: darkBlueColor
              //     gradient: LinearGradient(
              //   colors: [
              //     Color(0xff19803d),
              //     Color(0xff34ff7c),
              //   ],
              // )
              ),
          child: SingleChildScrollView(
              child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(children: <Widget>[
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                        onEnded: (metaData) {
                          _controller.seekTo(Duration());
                          _controller.pause();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.video.title,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  widget.video.author,

                                  // style: AppTextStyle
                                  //     .regular12SecondaryPurple()
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: (15),
                                    color: blueColor,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                      //model.dateFormat.format(
                                      //  DateTime.tryParse(
                                      widget.video.date),
                                  // style: AppTextStyle
                                  //     .regular10PrimaryOrange()),
                                ],
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: <Widget>[
                              //         // CustomText(

                              //         //       text: article.articles?
                              //         //       .userModel?.name ?? "username loading..."),
                              //         Text(
                              //           'Plant',
                              //           style: biggerText,
                              //         ),
                              //         Text(
                              //           'Vegetable',
                              //           style: smallerText,
                              //         ),
                              //         SizedBox(
                              //           height: 20,
                              //         ),
                              //         Text(
                              //           'Type',
                              //           style: biggerText,
                              //         ),
                              //         Text(
                              //           'Water Plant',
                              //           style: smallerText,
                              //         )
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       width: 80,
                              //     ),
                              //     Image.asset(
                              //       'images/ficus.png',
                              //       height: 220,
                              //       width: 100,
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.video.description,
                                    style: smallerText,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                    ]),
                  ))),
        ))));
  }
}

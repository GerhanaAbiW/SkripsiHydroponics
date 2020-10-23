import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/features/MenuLearning/Article/WidgetArticleList.dart';
import 'package:provider/provider.dart';

var blueColor = Color(0xFF3232FF);
var darkBlueColor = Color(0xFF3F51B5);
var lightblue = Color(0xFFadd8e6);

class ArticleDetail extends StatefulWidget {
  Article article;
  ArticleDetail(this.article);
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  TextStyle biggerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle smallerText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hydro Article',
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
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(children: <Widget>[
                      Text(
                        widget.article.title,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        "${widget.article.image}",
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("by,"),

                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                      //model.dateFormat.format(
                                      //  DateTime.tryParse(
                                      widget.article.author),
                                  // style: AppTextStyle
                                  //     .regular10PrimaryOrange()),
                                ],
                              ),
                              // Container(
                              //   padding: const EdgeInsets.only(bottom: 4),

                              //   child: Text(
                              //     widget.article.author,

                              //     // style: AppTextStyle
                              //     //     .regular12SecondaryPurple()
                              //   ),
                              // ),
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
                                      widget.article.date),
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
                                  Text(widget.article.description,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
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

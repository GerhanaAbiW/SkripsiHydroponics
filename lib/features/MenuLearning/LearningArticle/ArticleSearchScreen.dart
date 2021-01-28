import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuLearning/LearningArticle/LearningArticleDetail.dart';
import 'package:hydroponics/features/MenuLearning/SearchLearning.dart';
import 'package:hydroponics/features/Widget/SearchVideo.dart';
import 'package:provider/provider.dart';

class ArticleSearchScreenUser extends StatefulWidget {
  @override
  _ArticleSearchScreenUserState createState() =>
      _ArticleSearchScreenUserState();
}

class _ArticleSearchScreenUserState extends State<ArticleSearchScreenUser> {
  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
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
        title: Text("Articles",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: Column(
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: SearchLearning(
              widget: ArticleSearchScreenUser(),
              search: "article",
              hint: "Cari Article...",
            ),
          ),
          Expanded(
            child: Container(

                //height: MediaQuery.of(context).size.height / 2,
                //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: articleProvider.articlesSearched.length < 1
                    ? Padding(
                        padding: const EdgeInsets.all(125.0),
                        child: Image.asset('images/not_found.png'),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        //height: 20,

                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: articleProvider.articlesSearched.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                child: Container(
                                  height:
                                      100, //MediaQuery.of(context).size.height,
                                  child: Card(
                                      elevation: 10.0,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LearningArticleDetail(
                                                            article:
                                                                articleProvider
                                                                        .articles[
                                                                    index])));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  child: Row(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      width:
                                                          70, //ScreenUtil().setWidth(60),
                                                      height:
                                                          60, //ScreenUtil().setWidth(60),
                                                      decoration:
                                                          new BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(),
                                                      ),
                                                      child: articleProvider
                                                                  .articles[
                                                                      index]
                                                                  .image !=
                                                              null
                                                          ? Image.network(
                                                              '${articleProvider.articles[index].image}',
                                                              fit: BoxFit.fill,
                                                            )
                                                          : Image.asset(
                                                              "images/bayam.jpeg")),
                                                ),
                                                SizedBox(width: 3.0),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                              articleProvider
                                                                  .articles[
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
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 8.0),
                                                          child: Text(
                                                              articleProvider
                                                                  .articles[
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
                                                )
                                              ])),
                                            ],
                                          ))),
                                ));
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

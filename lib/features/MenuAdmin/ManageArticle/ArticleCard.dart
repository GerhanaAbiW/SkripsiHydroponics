import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Article.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/ArticleUpdate.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ArticleService _articleService = ArticleService();
    return Container(
      height: 100, //MediaQuery.of(context).size.height,
      child: Card(
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                changeScreen(context, ArticleUpdate(article: article,));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 70,
                              //ScreenUtil().setWidth(60),
                              height: 60,
                              //ScreenUtil().setWidth(60),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(),
                              ),
                              child: article.image !=
                                  null
                                  ? Image.network(
                                '${article.image}',
                                fit: BoxFit.fill,
                              )
                                  : Image.asset("images/bayam.jpeg")),
                        ),
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
                                  width: MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.6,
                                  child: Text(
                                      article.title,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0),
                                  child: Text(
                                      article.date,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey)),
                                )
                              ]),
                        )
                      ])),
                  GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      _articleService.deleteArticle(
                          article.id);
                    },
                  )
                ],
              ))),
    );
  }
}


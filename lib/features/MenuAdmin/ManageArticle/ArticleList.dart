import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/AddArticle.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/ArticleCard.dart';
import 'package:hydroponics/features/Widget/SearchArticle.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: SearchArticle(),
        ),
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
            child: articleProvider.articles.length == 0 ||
                    articleProvider.articles.length == null
                ? Padding(
                    padding: const EdgeInsets.all(125.0),
                    child: Image.asset('images/not_found.png'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: articleProvider.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          child: ArticleCard(
                            article: articleProvider.articles[index],
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
                  )),
      ],
    );
  }
}

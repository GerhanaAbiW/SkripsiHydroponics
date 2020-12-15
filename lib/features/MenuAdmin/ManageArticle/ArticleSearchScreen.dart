import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Services/ArticleServices.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/AddArticle.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/ArticleCard.dart';
import 'package:hydroponics/features/OrderList/AdminOrderList/ProductOrderAdmin/AdminOrderDetails.dart';
import 'package:hydroponics/features/Widget/SearchArticle.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:provider/provider.dart';

class ArticleSearchScreen extends StatefulWidget {
  @override
  _ArticleSearchScreenState createState() => _ArticleSearchScreenState();
}

class _ArticleSearchScreenState extends State<ArticleSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            backScreen(context);
          },
        ),
        title: Text("Search",
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21)),
      ),
      body: ListView(
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
              child: articleProvider.articlesSearched.length < 1
                  ? Padding(
                      padding: const EdgeInsets.all(125.0),
                      child: Image.asset('images/not_found.png'),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: articleProvider.articlesSearched.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: ArticleCard(
                              article: articleProvider.articlesSearched[index],
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
      ),
    );
  }
}

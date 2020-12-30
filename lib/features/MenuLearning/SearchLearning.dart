import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:provider/provider.dart';

class SearchLearning extends StatelessWidget {
  final Widget widget;
  final String search;
  final String hint;

  const SearchLearning({Key key, this.widget,this.search,this.hint}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    final videoProvider = Provider.of<VideoProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (pattern) async {
                if(search=="article"){
                  await articleProvider.search(articleTitle: pattern);
                  changeScreen(context, widget);

                }else{
                  await videoProvider.search(videoTitle: pattern);
                  changeScreen(context, widget);
                }
                },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[800],
                ),
                //fillColor: Colors.greenAccent[600],
                hintStyle: new TextStyle(color: Colors.green[600]),
                hintText: hint,
              ),
              autofocus: false,
            ),
          ),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.greenAccent[600],
          )),
    );
  }
}

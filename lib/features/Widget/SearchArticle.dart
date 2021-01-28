import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuAdmin/ManageArticle/ArticleSearchScreen.dart';
import 'package:provider/provider.dart';

class SearchArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (pattern) async {
                await articleProvider.search(articleTitle: pattern);
                changeScreen(context, ArticleSearchScreen());
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
                hintStyle: new TextStyle(color: Colors.grey[500]),
                hintText: "Cari Artikel...",
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

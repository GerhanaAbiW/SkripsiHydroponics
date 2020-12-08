import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuAdmin/ManageProduct/ProductSearchScreen.dart';
import 'package:hydroponics/features/MenuMarket/ProductSearchScreen.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatelessWidget {
  final Widget widget;
  final String search;

  const SearchProduct({Key key, this.widget, this.search}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (pattern)async{
                await productProvider.search(productName: pattern);
                changeScreen(context, widget);
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
                prefixIcon: Icon(Icons.search),
                fillColor: Color(0xFFF2F4F5),
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: search,
              ),
              autofocus: false,
            ),
          ),
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          )),
    );
  }
}

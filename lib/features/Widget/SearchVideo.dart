import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuAdmin/ManageVideo/VideoSearchScreen.dart';
import 'package:provider/provider.dart';

class SearchVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Theme(
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (pattern) async {
                await videoProvider.search(videoTitle: pattern);
                changeScreen(context, VideoSearchScreen());
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
                hintText: "Cari Video...",
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

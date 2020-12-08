import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/FavoriteProduct/FavoriteCard.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenTosca,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Favorite Product',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          //height: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
          ),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: userProvider.userModel.favorite.length, //plantProvider.plants.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: FavoriteCard(product: userProvider.userModel.favorite[index])
              );
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
    );
  }
}

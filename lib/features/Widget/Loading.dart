import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Stack(children: <Widget>[
          // Align(alignment: Alignment.center,
          //   child: CircleAvatar(
          //     //color: Colors.white,
          //     backgroundImage: AssetImage("images/categories/Bibit.png"),
          //   ),),
          Align(
            alignment: Alignment.center,
            child: SpinKitDualRing(
              color: Colors.green[900],
              size: 80.0,
// controller: AnimationController(duration: Duration(milliseconds: 1200),vsync: this),
            ),
          ),
        ],)
      ),
    );
  }
}


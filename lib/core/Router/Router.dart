import 'package:flutter/material.dart';
import 'package:hydroponics/features/LoginRegister/Login.dart';
import 'package:hydroponics/features/LoginRegister/Register.dart';
import 'package:hydroponics/features/MenuLearning/ArticleDetail.dart';

import 'package:hydroponics/features/MenuLearning/MenuLearning.dart';
import 'package:hydroponics/features/MenuMyPlants/MyPlantsList.dart';

import 'Router_Constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Init:
      //   return MaterialPageRoute(builder: (context) => ScreenUtilsInit());
      case Login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Register:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case Myplant:
        return MaterialPageRoute(builder: (context) => MyPlantsList());
      case Learning:
        return MaterialPageRoute(builder: (context) => ArticleDetail());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

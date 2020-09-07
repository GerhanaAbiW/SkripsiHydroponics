import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';

import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';




import 'package:hydroponics/features/Dashboard/DashBoard.dart';

import 'package:hydroponics/features/Widget/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'features/LoginRegister/Login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),


  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.white
    ),
    home: ScreensController(),
  ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
        return LoginPage();
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return DashBoard();
      default: return LoginPage();
    }
  }
}

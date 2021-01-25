import 'package:flutter/material.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/Providers/BrandProvider.dart';
import 'package:hydroponics/core/Providers/CategoryProvider.dart';
import 'package:hydroponics/core/Providers/HydroOrderProvider.dart';
import 'package:hydroponics/core/Providers/OrderProvider.dart';
import 'package:hydroponics/core/Providers/PaymentProvider.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';

import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Providers/VideoProvider.dart';

import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/features/Widget/Loading.dart';

import 'package:hydroponics/features/Widget/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'features/LoginRegister/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ChangeNotifierProvider.value(value: PlantProvider.initialize()),
      ChangeNotifierProvider.value(value: AppProvider()),
      ChangeNotifierProvider.value(value: OrderProvider.initialize()),
      ChangeNotifierProvider.value(value: HydroOrderProvider.initialize()),
      ChangeNotifierProvider.value(value: PaymentProvider.initialize()),
      ChangeNotifierProvider.value(value: ArticleProvider.initialize()),
      ChangeNotifierProvider.value(value: VideoProvider.initialize()),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
      ChangeNotifierProvider.value(value: BrandProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: ScreensController(),
    ),
  ));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
        return SplashScreen();
      case Status.Authenticating:
        return DashBoard();
      case Status.Authenticated:
        return DashBoard();
      default:
        return LoginPage();
    }
  }
}

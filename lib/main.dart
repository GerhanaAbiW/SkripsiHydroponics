import 'package:flutter/material.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/LoginRegister/Login.dart';
//import 'package:hydroponics/features/LoginRegister/Register.dart';
//import 'package:hydroponics/features/LoginRegister/LoginRegister.dart';
// import 'package:hydroponics/LoginRegister/Login.dart';
// import 'package:hydroponics/LoginRegister/LoginRegister.dart';
// import 'package:hydroponics/LoginRegister/Register.dart';

import 'package:hydroponics/features/Dashboard/DashBoard.dart';
// import 'package:hydroponics/MenuAdmin/AddProduct.dart';
// import 'package:hydroponics/MenuAdmin/Dashboard.dart';
// import 'package:hydroponics/MenuAdmin/MenuAdmin.dart';
// import 'package:hydroponics/MenuLearning/MenuArticleDetail.dart';
// import 'package:hydroponics/MenuLearning/MenuLearning.dart';
// import 'package:hydroponics/MenuMarket/Cart.dart';
// import 'package:hydroponics/MenuMarket/CartProduct.dart';
// import 'package:hydroponics/MenuMarket/Market.dart';
// import 'package:hydroponics/MenuMyPlants/MyPlantsDetails.dart';
// import 'package:hydroponics/MenuMyPlants/MyPlantsList.dart';
// import 'package:hydroponics/Profile/NewProfilePage.dart';
// import 'package:hydroponics/Profile/ProfilePage.dart';
import 'package:hydroponics/core/Provider/UserProvider.dart';
import 'package:hydroponics/features/Widget/SplashScreen.dart';
import 'package:hydroponics/home.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      routes: {
//        '/': (BuildContext _) => MainMenu(),
//        '1': (BuildContext _) => MyPlantsDetail(),
//        '2': (BuildContext _) => MyPlantsList(),
//        '3': (BuildContext _) => MenuMarket(),
//        '4': (BuildContext _) => LoginRegister(),
//        "5": (BuildContext _) => Home(),
//        "6": (BuildContext _) => MenuLearning(),
//        "7": (BuildContext _) => MenuAdmin(),
//        "8": (BuildContext _) => Dashboard(),
//        "9": (BuildContext _) => AddProduct(),
//        "10": (BuildContext _) => ArticleDetail(),
//        "11": (BuildContext _) => CartPage(),
//        //"12": (BuildContext _) => ProfilePage(),
//        "13": (BuildContext _) => NewProfilePage(),
//        "14": (BuildContext _) => RegisterScreen(),
//
//      },
//      initialRoute: '14',
//    );
//  }
//}
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        //ChangeNotifierProvider.value(value: AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: GreenTosca),
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return MainMenu();
      default:
        return LoginScreen();
    }
  }
}

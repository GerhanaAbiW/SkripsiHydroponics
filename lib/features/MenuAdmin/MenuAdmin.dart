import 'package:flutter/material.dart';

import 'package:hydroponics/features/MenuAdmin/AppState.dart';
import 'package:hydroponics/features/MenuAdmin/Dashboard.dart';
import 'package:hydroponics/features/MenuAdmin/ProductProvider.dart';
import 'package:provider/provider.dart';

class MenuAdmin extends StatefulWidget {
  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppState()),
        ChangeNotifierProvider.value(value: ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
  }
}

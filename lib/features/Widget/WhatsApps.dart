

import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class WhatsApps extends StatefulWidget {
  @override
  _WhatsAppsState createState() => _WhatsAppsState();
}

class _WhatsAppsState extends State<WhatsApps> {
  // void whatsAppOpen() async {
  //   bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
  //
  //   if (whatsapp) {
  //     await FlutterLaunch.launchWathsApp(phone: "08881615116", message: "Hello, flutter_launch");
  //   } else {
  //     print("Whatsapp não instalado");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      body: Center(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Whatsapp",)
              ],
            ),
            onPressed: () {
              FlutterOpenWhatsapp.sendSingleMessage("085728248887", "Hello");
              //whatsAppOpen(phone: "08881615116", message: "hello");
            },
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantsDetails.dart';
import 'package:hydroponics/features/Profile/ProfileViewModel.dart';
import 'package:hydroponics/features/Widget/ContactUSViewModel.dart';

class WhatsApps extends StatefulWidget {
  @override
  _WhatsAppsState createState() => _WhatsAppsState();
}

class _WhatsAppsState extends State<WhatsApps> {
  List<ListContactUs> listSection = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
    // Provider.of<UserProvider>(context, listen: false).reloadUserModel();
  }

  // void whatsAppOpen() async {
  //   bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
  //
  //   if (whatsapp) {
  //     await FlutterLaunch.launchWathsApp(phone: "08881615116", message: "Hello, flutter_launch");
  //   } else {
  //     print("Whatsapp não instalado");
  //   }
  // }
  void whatsAppOpen() {}
  void createListItem() {
    listSection.add(createSection("TokoHidroponikABC@gmail.com", Icons.email,
        Colors.blue.shade800, true));
    // listSection.add(createSection(
    //     "Payment Method", Icons.payment, Colors.teal.shade800, null));
    listSection.add(createSection(
        "+6287782870044", Icons.phone, Colors.indigo.shade800, true));
    listSection.add(createSection("Jalan raden fatah RT 03/06 no.26",
        Icons.home, Colors.black.withOpacity(0.8), true));
    listSection.add(
        createSection("Whatsapp", Icons.apps, Colors.red.withOpacity(0.7), false
            //color: Colors.grey.shade500,
            ));
  }

  createSection(String title, IconData icon, Color color, bool icon2) {
    return ListContactUs(
      title,
      icon,
      color,
      icon2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomPadding: true,
      body: Builder(builder: (context) {
        return Container(
          child: Stack(
            children: <Widget>[
              Card(
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: red.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration:
                              BoxDecoration(color: red, shape: BoxShape.circle),
                        ),
                        top: -70,
                        left: -40,
                      ),
                      Positioned(
                        child: Container(
                          width: 300,
                          height: 260,
                          decoration: BoxDecoration(
                              color: red.withOpacity(0.5),
                              shape: BoxShape.circle),
                        ),
                        top: -40,
                        left: -40,
                      ),
                      Positioned(
                        child: Align(
                          child: Container(
                            width: 400,
                            height: 260,
                            decoration: BoxDecoration(
                                color: red.withOpacity(0.5),
                                shape: BoxShape.circle),
                          ),
                        ),
                        top: -40,
                        left: -40,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Connect With US",
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(color: Colors.white, fontSize: 24),
                ),
                margin: EdgeInsets.only(top: 72, left: 24),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Card(
                              margin:
                                  EdgeInsets.only(top: 50, left: 16, right: 16),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 8, top: 8, right: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        // IconButton(
                                        //   icon: Icon(Icons.settings),
                                        //   iconSize: 24,
                                        //   color: Colors.black,
                                        //   onPressed: () {},
                                        // ),
                                        // IconButton(
                                        //   icon: Icon(Icons.edit),
                                        //   color: Colors.black,
                                        //   iconSize: 24,
                                        //   onPressed: () {
                                        //     // changeScreen(
                                        //     //     context, EditProfilePage());
                                        //   },
                                        // )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("Reach Us",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "We would love to respon to your queries and help you success. Fell free to get i touch with us",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                  ),
                                  buildListView()
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            //   //child: user.userModel.userPicture == null
                            //       ? Container(
                            //           width: 100,
                            //           height: 100,
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.grey.shade400,
                            //                   width: 2),
                            //               shape: BoxShape.circle,
                            //               image: DecorationImage(
                            //                   image: AssetImage(
                            //                       "images/asset_profile/placeholderprofile.png"),
                            //                   fit: BoxFit.contain)))
                            //       : Container(
                            //           decoration: BoxDecoration(
                            //             border: Border.all(
                            //                 color: Colors.grey.shade400,
                            //                 width: 2),
                            //             shape: BoxShape.circle,
                            //             // image: DecorationImage(
                            //             //     image: AssetImage(
                            //             //         "images/asset_profile/deku.jpeg"),
                            //             //     fit: BoxFit.contain)
                            //           ),
                            // width: 100,
                            // height: 100,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                    child: Align(
                                  alignment: Alignment.center,
                                  // child: Loading(),
                                )),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //child: FadeInImage.memoryNetwork(
                                  // placeholder: kTransparentImage,
                                  // image: user.userModel.userPicture,
                                  //   height: MediaQuery.of(context).size.height,
                                  //   fit: BoxFit.cover,
                                  // ),
                                )
                              ],
                            ),
                            //         ),
                          ),
                        ],
                      ),
                    ),
                    flex: 75,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 05,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
    // return Scaffold(
    //   appBar: new AppBar(
    //     title: new Text('Plugin example app'),
    //   ),
    //   body: Center(
    //       child: FlatButton(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text("Whatsapp",)
    //           ],
    //         ),
    //         onPressed: () {
    //           FlutterOpenWhatsapp.sendSingleMessage("085728248887", "Hello");
    //           //whatsAppOpen(phone: "08881615116", message: "hello");
    //         },
    //       )
    //   ),
    // );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListContactUs listSection) {
    return Builder(builder: (context) {
      return listSection.title == "Whatsapp"
          ? InkWell(
              splashColor: Colors.teal.shade200,
              onTap: () {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "+6285728248887", "Hello");
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 12),
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: listSection.color),
                        child: Icon(
                          listSection.icon,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      flex: 8,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          listSection.title,
                          style: CustomTextStyle.textFormFieldMedium,
                        ),
                      ),
                      flex: 84,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Offstage(
                      offstage: listSection.icon2,
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 16, right: 12),
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: listSection.color),
                      child: Icon(
                        listSection.icon,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    flex: 8,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        listSection.title,
                        style: CustomTextStyle.textFormFieldMedium,
                      ),
                    ),
                    flex: 84,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Offstage(
                    offstage: listSection.icon2,
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.grey.shade500,
                    ),
                  )
                ],
              ),
            );
    });
  }
}

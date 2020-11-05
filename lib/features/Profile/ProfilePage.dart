import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/Profile/ChangePassword.dart';
import 'package:hydroponics/features/Profile/ProfileViewModel.dart';
import 'package:provider/provider.dart';

import 'AboutUsPage.dart';
import 'EditProfilePage.dart';
//import 'InviteFriendsPage.dart';
import 'NotificationPage.dart';

var darkGreenColor = Color(0xFF689F38);

class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  List<ListProfileSection> listSection = new List();
  UserModel user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
    Provider.of<UserProvider>(context, listen: false).reloadUserModel();

  }

  void createListItem() {
    listSection.add(createSection("Notifications", Icons.notifications,
        Colors.blue.shade800, NotificationPage()));
    // listSection.add(createSection(
    //     "Payment Method", Icons.payment, Colors.teal.shade800, null));
    listSection.add(createSection("Change Password", Icons.lock,
        Colors.indigo.shade800, ChangePasswordPage()));
    listSection.add(createSection(
        "About Us", Icons.help, Colors.black.withOpacity(0.8), AboutPage()));
    listSection.add(createSection(
        "Logout", Icons.exit_to_app, Colors.red.withOpacity(0.7), null));
  }

  createSection(String title, IconData icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
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
                      color: darkGreenColor.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: darkGreenColor, shape: BoxShape.circle),
                        ),
                        top: -70,
                        left: -40,
                      ),
                      Positioned(
                        child: Container(
                          width: 300,
                          height: 260,
                          decoration: BoxDecoration(
                              color: darkGreenColor.withOpacity(0.5),
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
                                color: darkGreenColor.withOpacity(0.5),
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
                  "Profile",
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
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,
                                          iconSize: 24,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfilePage()));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                      text: user?.name ??
                                          "username loading..."),
                                  CustomText(
                                      text: user?.email ??
                                          "email loading..."),
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
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 2),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/asset_profile/deku.jpeg"),
                                      fit: BoxFit.contain)),
                              width: 100,
                              height: 100,
                            ),
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

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          if (listSection.widget != null) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => listSection.widget));
          }
          if (listSection.title == "Logout") {
            _showDialog();
          }
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
              Icon(
                Icons.navigate_next,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      );
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          title: new Text("Anda akan keluar dari akun Anda",
              style: TextStyle(
                  color: darkGreenColor, fontWeight: FontWeight.bold)),
          content: new Text(
            "Apakah Anda yakin ingin keluar dari akun Anda?",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              children: <Widget>[
                // Expanded(
                //   child:
                new FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: black,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Batal',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  ),
                ),
                //),
                SizedBox(
                  width: 16,
                ),
                // Expanded(
                //   child:
                new FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: darkGreenColor,
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .signOut(context);
                  },
                  child: Text(
                    'Ya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // ),
              ],
            )
            // new FlatButton(
            //   child: new Text("Ya"),
            //   onPressed: () {
            //     Provider.of<UserProvider>(context, listen: false)
            //         .signOut(context);
            //   },
            // ),
          ],
        );
      },
    );
  }
}

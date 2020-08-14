import 'package:flutter/material.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/LoginRegister/Login.dart';
import 'package:hydroponics/core/Provider/UserProvider.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF00a79B),
      // ),
      body: user.status == Status.Authenticating
          ? Loading()
          : Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    //padding: const EdgeInsets.only(left: 0, top: 16),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(8),
                    height: 30,
                    width: 50,
                    child: FlatButton(
                      child: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  //BackButtonWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Selamat Datang di\nHydroasik",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: GreenTosca, fontSize: 21),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Kami membantu Anda untuk mempelajari, mempermudah mendapatkan perlengkapan, dan mengajak Anda untuk langsung praktik menanam secara Hidroponik\n\n",
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: GreenTosca, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.person), onPressed: null),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  controller: _name,
                                  decoration:
                                      InputDecoration(hintText: 'Username'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The name field cannot be empty";
                                    }
                                    return null;
                                  },
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.mail), onPressed: null),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  controller: _email,
                                  decoration:
                                      InputDecoration(hintText: 'Email'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.lock), onPressed: null),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: 'Password'),
                                  controller: _password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                )))
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Radio(value: null, groupValue: null, onChanged: null),
                  //       RichText(
                  //           text: TextSpan(
                  //               text: 'I have accepted the',
                  //               style: TextStyle(color: Colors.black),
                  //               children: [
                  //             TextSpan(
                  //                 text: 'Terms & Condition',
                  //                 style: TextStyle(
                  //                     color: Colors.teal,
                  //                     fontWeight: FontWeight.bold))
                  //           ]))
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 60,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              if (!await user.signUp(
                                  _name.text, _email.text, _password.text)) {
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Sign up failed")));
                                return;
                              }
                              changeScreenReplacement(context, LoginScreen());
                            }
                          },
                          color: GreenTosca,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// class BackButtonWidget extends StatelessWidget {
//   const BackButtonWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               fit: BoxFit.cover, image: AssetImage('images/bayam.jpeg'))),
//       child: Positioned(
//           child: Stack(
//         children: <Widget>[
//           Positioned(
//               top: 20,
//               child: Row(
//                 children: <Widget>[
//                   IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       }),
//                   Text(
//                     'Back',
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               )),
//           Positioned(
//             bottom: 20,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Create New Account',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/core/Router/Router_Constants.dart';
import 'package:hydroponics/features/LoginRegister/Login.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible;
  bool _confirmPasswordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cPassword = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              GreenTosca,
                              green,
                              CustomColors.COLOR_GREEN
                            ],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Text("Register",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        Center(
                          child: Image.asset("images/plant.png"),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                                controller: _name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Fullname",
                                  prefixIcon: Icon(Icons.person,
                                      color: Color(0xff19803d)),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
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
                              controller: _email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                prefixIcon:
                                    Icon(Icons.email, color: Color(0xff19803d)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                                controller: _password,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xff19803d),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xff19803d),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                                controller: _cPassword,
                                obscureText: !_confirmPasswordVisible,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm Password',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xff19803d),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _confirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xff19803d),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _confirmPasswordVisible =
                                            !_confirmPasswordVisible;
                                      });
                                    },
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  if (await user.signUp(_name.text, _email.text,
                                          _password.text) ==
                                      true) {
                                    changeScreenReplacement(
                                        context, LoginPage());
                                  }
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        GreenTosca,
                                        green,
                                        CustomColors.COLOR_GREEN
                                      ],
                                      end: Alignment.centerLeft,
                                      begin: Alignment.centerRight),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Already a member ? ",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => changeScreenReplacement(
                                          context, LoginPage()),
                                    text: "Login",
                                    style: TextStyle(color: green)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

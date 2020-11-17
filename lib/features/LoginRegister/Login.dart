import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/LoginRegister/Register.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  //for visibile
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  InputDecoration decor = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.green, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.green[700], width: 1),
      ));

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/plant.png'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Plant App',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      width: width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60)),
                          gradient: LinearGradient(colors: [
                            Color(0xff19803d),
                            Color(0xff34ff7c),
                          ])),
                    ),
                    Container(
                      width: width * 0.8,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
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
                                decoration: decor.copyWith(
                                    hintText: 'Email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xff19803d),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
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
                                decoration: decor.copyWith(
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
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
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  if (await user.signIn(
                                          _email.text, _password.text) ==
                                      true)
                                    changeScreenReplacement(
                                        context, DashBoard());
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff19803d),
                                      Color(0xff34ff7c),
                                    ])),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Don't have an account?",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () => changeScreenReplacement(
                                          context, RegisterPage()),
                                    text: "Register",
                                    style: TextStyle(color: green)),
                              ]),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

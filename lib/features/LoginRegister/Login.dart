import 'package:flutter/material.dart';
import 'package:hydroponics/core/Routing/ChangeRoute.dart';
import 'package:hydroponics/features/LoginRegister/Register.dart';
import 'package:hydroponics/Provider/UserProvider.dart';
import 'package:hydroponics/Widget/Loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: user.status == Status.Authenticating
            ? Loading()
            : ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/bayam.jpeg'))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.person), onPressed: null),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  controller: _email,
                                  decoration:
                                      InputDecoration(hintText: 'Username'),
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
                                  controller: _password,
                                  decoration:
                                      InputDecoration(hintText: 'Password'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 60,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              if (!await user.signIn(
                                  _email.text, _password.text))
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Sign in failed")));
                            }
                          },
                          color: Color(0xFF00a79B),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      changeScreenReplacement(context, RegisterScreen());
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'SIGN UP',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

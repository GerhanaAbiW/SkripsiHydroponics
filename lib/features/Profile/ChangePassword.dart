import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:provider/provider.dart';

var darkGreenColor = Color(0xFF689F38);

class ChangePasswordPage extends StatefulWidget {
  // final UserModel user;
  //
  // const ChangePasswordPage({Key key, this.user}) : super(key: key);
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _password = TextEditingController();
  TextEditingController _cPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
        // key: _formKey,
        // resizeToAvoidBottomPadding: true,
        // resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: darkGreenColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Change Password',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            // child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              //Container(
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    FormTextField(
                      textLabel: "Password Lama",
                      textHint: "Masukkan Password Lama Anda",
                      controller: _password,
                    ),

                    //),
                    //Container(
                    SizedBox(height: 16),
                    FormTextField(
                      textLabel: "Password Baru",
                      textHint: "Masukkan Password Baru Anda",
                      controller: _cPassword,
                    ),
                  ],
                ),
              ),
              // ),

              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        if (await user.resetPassword(_password.text) == true) {
                          user.signOut(context);
                        }
                      }
                      //   if (_formKey.currentState.validate()) {
                      //     if (await user.sendPasswordResetEmail(
                      //     _email.text) ==
                      //   true)
                      //   changeScreenReplacement(
                      //   context, LoginPage());
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: darkGreenColor),
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.only(left: 48, right: 48),
              //   child: RaisedButton(
              //     color: Colors.blue,
              //     textColor: Colors.white,
              //     onPressed: () {
              //       model.updateUser(_name.text, _email.text);
              //     },
              //     child: Text(
              //       "Save",
              //       style: CustomTextStyle.textFormFieldBlack
              //           .copyWith(color: Colors.white, fontSize: 16),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      //)
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.grey));
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/Dashboard.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Models/User.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/Profile/ProfilePage.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:hydroponics/features/Widget/Loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

var darkGreenColor = Color(0xFF689F38);

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  const EditProfilePage({Key key, this.user}) : super(key: key);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File _image;
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorHPController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  Future getImage(ImageSource media) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: media);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    nameController.text = widget.user.name;
    emailController.text = widget.user.email;
    jenisKelaminController.text = widget.user.gender;
    dateController.text = widget.user.dob;
    nomorHPController.text = widget.user.phone;
    alamatController.text = widget.user.address;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context,listen: false);
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       }),
        //   title: Text(
        //     "Edit Profile",
        //     style: CustomTextStyle.textFormFieldBlack.copyWith(
        //         color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        //   ),
        // ),
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
            'Edit Profile',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            // child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),

              FlatButton(
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Stack(
                    alignment: Alignment(0.75, 1.1),
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        child: model.userModel.userPicture != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(44.0),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Align(
                                      alignment: Alignment.center,
                                      child: Loading(),
                                    )),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(80)),
                                      //width: MediaQuery.of(context).size.width,
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: model.userModel.userPicture,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Image.asset(
                                "images/asset_profile/User_Profile_Green.png"),
                      ),
                      Container(width: 24, child: Icon(Icons.camera_alt)
                          // Image.asset('images/asset_profile/ic_about_us.png'),
                          ),
                    ],
                  ),
                ),
                onPressed: () {
                  myAlert();
                },
              ),
              SizedBox(
                height: 30,
              ),

              //Center(
              // child: Container(
              //   width: 188,
              //   height: 188, //ScreenUtil().setWidth(88),
              //   child: model.profileImage != null
              //       ? ClipRRect(
              //           borderRadius: BorderRadius.only(
              //               topLeft: const Radius.circular(80.0),
              //               topRight: const Radius.circular(80.0)
              //               //ScreenUtil().setWidth(44)
              //               ),
              //           child: Image.memory(
              //             model.profileImage,
              //             fit: BoxFit.cover,
              //             height: 300, //ScreenUtil().setWidth(88),
              //           ),
              //         )
              //       : model.imageUrl != null
              //           ? ClipRRect(
              //               borderRadius: BorderRadius.only(
              //                   topLeft: const Radius.circular(20.0),
              //                   topRight: const Radius.circular(20.0)
              //                   //ScreenUtil().setWidth(44)
              //                   ),
              //               child: Image.network(
              //                 model.imageUrl,
              //                 fit: BoxFit.cover,
              //                 height:
              //                     // ScreenUtil().setWidth(88),
              //                     300,
              //               ),
              //             )
              //           : Image.asset('images/Icons/1.png'),
              // ),
              //),

              //gap

              // Stack(
              //   children: <Widget>[
              //     Align(
              //       alignment: Alignment.center,
              //       child: Container(
              //         width: 120,
              //         height: 120,
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             gradient: LinearGradient(colors: [
              //               CustomColors.EDIT_PROFILE_PIC_FIRST_GRADIENT,
              //               CustomColors.EDIT_PROFILE_PIC_SECOND_GRADIENT
              //             ])),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.center,
              //       child: Container(
              //         width: 120,
              //         height: 120,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             IconButton(
              //                 icon: Icon(
              //                   Icons.image,
              //                   color: Colors.white,
              //                 ),
              //                 onPressed: () {}),
              //             Text(
              //               "Choose Image",
              //               style: CustomTextStyle.textFormFieldMedium
              //                   .copyWith(color: Colors.white, fontSize: 12),
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    FormTextField(
                      textLabel: "Nama",
                      textHint: model.userModel.name == null
                          ? "Masukkan Nama Anda"
                          : model.userModel.name,
                      controller: nameController,
                    ),

                    // Container(
                    //   child: TextFormField(
                    //     controller: _name,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(12),
                    //       border: border,
                    //       hintText: "Name",
                    //       focusedBorder: border.copyWith(
                    //           borderSide: BorderSide(color: Colors.blue)),
                    //     ),
                    //   ),
                    //   margin: EdgeInsets.only(left: 12, right: 12, top: 24),
                    // ),
                    // Container(
                    //   child: TextFormField(
                    //     controller: _email,
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(12),
                    //         border: border,
                    //         hintText: "Tanggal Lahir",
                    //         focusedBorder: border.copyWith(
                    //             borderSide: BorderSide(color: Colors.blue))),
                    //   ),
                    //   margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                    // ),
                    SizedBox(height: 16),
                    DateFormField(
                        textLabel: "Tanggal Lahir",
                        textHint: model.userModel.dob == null
                            ? "Masukkan Tanggal Lahir Anda"
                            : model.userModel.dob,
                        controller: dateController),

                    SizedBox(height: 16),
                    FormTextField(
                        textLabel: "Jenis Kelamin",
                        textHint: model.userModel.gender == null
                            ? "Masukkan Jenis Kelamin Anda"
                            : model.userModel.gender,
                        controller: jenisKelaminController),

                    // Container(
                    //   child: TextFormField(
                    //     controller: _email,
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(12),
                    //         border: border,
                    //         hintText: "Jenis Kelamin",
                    //         focusedBorder: border.copyWith(
                    //             borderSide: BorderSide(color: Colors.blue))),
                    //   ),
                    //   margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                    // ),
                    SizedBox(height: 16),
                    FormTextField(
                      textType: TextInputType.emailAddress,
                      textLabel: "Email",
                      textHint: model.userModel.email == null
                          ? "Masukkan Email Anda"
                          : model.userModel.email,
                      controller: emailController,
                    ),

                    // Container(
                    //   child: TextFormField(
                    //     controller: _email,
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(12),
                    //         border: border,
                    //         hintText: "Email",
                    //         focusedBorder: border.copyWith(
                    //             borderSide: BorderSide(color: Colors.blue))),
                    //   ),
                    //   margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    //   child: Text(
                    //     "Nomor HP",
                    //     style: new TextStyle(
                    //         fontWeight: FontWeight.w700, color: Colors.black),
                    //   ),
                    // ),
                    // Container(
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(12),
                    //         border: border,
                    //         hintText: "Nomor HP",
                    //         focusedBorder: border.copyWith(
                    //             borderSide: BorderSide(color: Colors.blue))),
                    //   ),
                    //   margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                    // ),
                    SizedBox(height: 16),
                    FormTextField(
                      textType: TextInputType.number,
                      textLabel: "Nomor HP",
                      textHint: model.userModel.phone == null
                          ? "Masukkan Nomor HP Anda"
                          : model.userModel.phone,
                      controller: nomorHPController,
                    ),
                    SizedBox(height: 16),
                    MultilineFormTextField(
                        textType: TextInputType.multiline,
                        textLabel: "Alamat",
                        textHint: model.userModel.address == null
                            ? "Masukkan Alamat Anda"
                            : model.userModel.address,
                        controller: alamatController,
                        height: 180.0),
                  ],
                ),
              ),

              // Container(
              //   child: TextField(
              //     keyboardType: TextInputType.multiline,
              //     minLines: 1, //Normal textInputField will be displayed
              //     maxLines: 5, // when user presses enter it will adapt to it

              //     //keyboardType: TextInputType.phone,
              //     decoration: InputDecoration(
              //         contentPadding: EdgeInsets.all(12),
              //         border: border,
              //         hintText: "Alamat",
              //         focusedBorder: border.copyWith(
              //             borderSide: BorderSide(color: Colors.blue))),
              //   ),
              //   margin: EdgeInsets.only(left: 12, right: 12, top: 12),
              // ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => isLoading = true);
                      if (_image != null) {
                        String imageUrl1;
                        final FirebaseStorage storage =
                            FirebaseStorage.instance;
                        final String picture1 =
                            "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                        StorageUploadTask task1 = storage
                            .ref()
                            .child("UserPicture")
                            .child(picture1)
                            .putFile(_image);
                        StorageTaskSnapshot snapshot1 =
                            await task1.onComplete.then((snapshot) => snapshot);

                        task1.onComplete.then((snapshot3) async {
                          imageUrl1 = await snapshot1.ref.getDownloadURL();
                          model.updateUser(
                              img: imageUrl1,
                              name: nameController.text,
                              role: model.userModel.role,
                              dob: dateController.text,
                              phone: nomorHPController.text,
                              gender: jenisKelaminController.text,
                              address: alamatController.text,
                              email: emailController.text);
                          _formKey.currentState.reset();
                          setState(() => isLoading = false);
                          Navigator.pop(context);
                        });
                      } else {
                        model.updateUser(
                            img: widget.user.userPicture,
                            name: nameController.text,
                            role: model.userModel.role,
                            dob: dateController.text,
                            phone: nomorHPController.text,
                            gender: jenisKelaminController.text,
                            address: alamatController.text,
                            email: emailController.text);
                        _formKey.currentState.reset();
                        setState(() => isLoading = false);
                        Navigator.pop(context);
                        setState(() => isLoading = false);
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: darkGreenColor),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
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

// var border = OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(4)),
//     borderSide: BorderSide(width: 1, color: Colors.grey));
}

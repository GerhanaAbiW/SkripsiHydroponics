import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/MenuAdmin/AppTools.dart';
import 'package:provider/provider.dart';

var darkGreenColor = Color(0xFF689F38);

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
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
        body: ListView(
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
                      child: model.profileImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(44),
                              //  ScreenUtil()
                              // .setWidth(44)),
                              child: Image.memory(
                                model.profileImage,
                                fit: BoxFit.cover,
                                height: 88, //ScreenUtil()
                                //.setWidth(88),
                              ),
                            )
                          : Image.asset(
                              'images/asset_profile/placeholderprofile.png'),
                    ),
                    Container(width: 24, child: Icon(Icons.camera_alt)
                        // Image.asset('images/asset_profile/ic_about_us.png'),
                        ),
                  ],
                ),
              ),
              onPressed: () {
                print("Pressed");
                model.selectImage();
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
            Container(
              child: productTextField(
                textTitle: "Nama",
                textHint: "Masukkan Nama Anda",
                //controller: prodcutDescriptionController,
              ),
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
            Container(
              child: productTextField(
                textTitle: "Tanggal Lahir",
                textHint: "Masukkan Tanggal Lahir Anda",
                //controller: prodcutDescriptionController,
              ),
            ),
            Container(
              child: productTextField(
                textTitle: "Jenis Kelamin",
                textHint: "Masukkan Jenis Kelamin Anda",
                //controller: prodcutDescriptionController,
              ),
            ),
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
            Container(
              child: productTextField(
                textType: TextInputType.emailAddress,
                textTitle: "Email",
                textHint: "Masukkan Email Anda",
                //controller: prodcutDescriptionController,
              ),
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
            Container(
              child: productTextField(
                textType: TextInputType.number,
                textTitle: "Nomor HP",
                textHint: "Masukkan Nomor HP Anda",
                //controller: prodcutDescriptionController,
              ),
            ),
            Container(
              child: productTextField(
                  textType: TextInputType.multiline,
                  textTitle: "Alamat",
                  textHint: "Masukkan Alamat Anda",
                  //controller: prodcutDescriptionController,
                  height: 180.0),
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
                onTap: () {},
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
      //)
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.grey));
}

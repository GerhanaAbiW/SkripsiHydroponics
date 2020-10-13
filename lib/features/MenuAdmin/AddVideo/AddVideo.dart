import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/Costumized_Text_Field.dart';
import 'package:hydroponics/features/MenuAdmin/AddArticle/AddArticle_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddVideoView extends StatefulWidget {
  @override
  _AddVideoViewState createState() => _AddVideoViewState();
}

class _AddVideoViewState extends State<AddVideoView> {
  bool isTrue = false;
  Radius topLeft;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController linkController= TextEditingController();
  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  TextEditingController authorController= TextEditingController();
  TextEditingController dateController = new TextEditingController();
  VideoService videoService = VideoService();
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.value = TextEditingValue(text: DateFormat('dd/MM/yyyy').format(picked).toString());
      });
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      videoService.uploadVideo({
        "link": linkController.text,
        "title" : titleController.text,
        "author": authorController.text,
        "date": dateController.text,
        "description": descriptionController.text


      });
      _formKey.currentState.reset();
      setState(() => isLoading = false);
      Navigator.pop(context);
    } else {
      setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                      Text(
                        'Lengkapi Data Untuk Video',
                        style: CustomTextStyle.textFormFieldBold
                            .copyWith(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: linkController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // validator: (value) => emptyValidation(value),
                        decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                  validator: (val) {
                    if (val.length == 0) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  // validator: (value) => emptyValidation(value),
                  decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                ),
                SizedBox(
                  height: 16,
                ),
                      TextFormField(
                        controller: authorController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autofocus: false,
//                          focusNode: _focusNode,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_focusScopeNode);
//                          },
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // validator: (value) => emptyValidation(value),
                        decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: dateController,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'Date of Birth',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
//                        Container(
//                          decoration: BoxDecoration(
//                            border: Border(
//                                bottom: BorderSide(
//                              width: 1,
//                              color: GreenTosca,
//                            )),
//                          ),
//                          child: Stack(
//                            alignment: Alignment.topLeft,
//                            children: <Widget>[
//                              Text(
//                                'Tanggal Lahir',
//                                style: CustomTextStyle.textFormFieldBold
//                                    .copyWith(
//                                        color: Colors.black, fontSize: 15),
//                              ),
//                              SizedBox(
//                                height: 12,
//                              ),
//                              Stack(
//                                alignment: Alignment.centerLeft,
//                                children: <Widget>[
//                                  // Provider.of<AddArticleViewModel>(context,listen: false).dateFormat.format();
//                                  Text(model.dateFormat
//                                      .format(model.selectedDate)),
//                                  FlatButton(
//                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
//                                    child: Align(
//                                      alignment: Alignment.bottomRight,
//                                      child: Icon(Icons.arrow_drop_down),
//                                      // child: Image(
//                                      //   image: arrow,
//                                      //   width: 56,
//                                      //   height: 56,
//                                      // ),
//                                    ),
//                                    onPressed: () => model.selectDate(context),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: GreenTosca,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Add Plant",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),

        ),
      ),

    );
  }
}

class CommonStyle{
  static InputDecoration textFieldStyle({String labelTextStr="",String hintTextStr=""}) {return InputDecoration(
    contentPadding: EdgeInsets.all(12),
    labelText: labelTextStr,
    labelStyle: TextStyle(
        color: Colors.green
    ),
    hintText:hintTextStr,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.green,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
  );
  }
}






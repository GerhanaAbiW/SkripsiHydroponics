import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hydroponics/core/constants/Colors.dart';

import 'App_Text_Style.dart';
// import 'package:psonesia/core/constants/app_text_style.dart';
// import 'package:psonesia/core/constants/colors.dart' as colors;

class CustomizedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  CustomizedTextField({this.label, this.controller});

  final Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: TextFormField(
        validator: (value) {
          //RegExp regex = new RegExp(pattern);

          if (value.isEmpty) {
            return 'Form tidak boleh kosong';
          }
          //else if (!regex.hasMatch(value) && label == 'Email') {
          //   return 'Format email salah';
          // }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.black, fontSize: 14),
            alignLabelWithHint: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: black),
            )),
        style: CustomTextStyle.textFormFieldBold
            .copyWith(color: Colors.black, fontSize: 14),
        textAlignVertical: TextAlignVertical(y: 0),
        maxLines: null,
        expands: true,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}

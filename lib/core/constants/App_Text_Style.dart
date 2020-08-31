import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';

class CustomTextStyle {
  static var textFormFieldRegular = TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  CustomText({@required this.text, this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size ?? 16, color: color ?? black, fontWeight: weight ?? FontWeight.normal),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'Colors.dart' as colors;

// TextStyle _textStyle(Color color, double size, FontWeight fontWeight,
//     TextDecoration textDecoration) {
//   return TextStyle(
//     fontFamily: 'Lato',
//     color: color,
//     fontSize: ScreenUtil().setSp(size),
//     fontWeight: fontWeight,
//     decoration: textDecoration,
//   );
// }

// class AppTextStyle {
//   ///TODO: Delete old style, replace with new color scheme
//   //10
//   static TextStyle regular10BaseColor() =>
//       _textStyle(colors.DarkGrey, 10, FontWeight.w400, TextDecoration.none);

//   //11
//   static TextStyle regular11BaseColor() =>
//       _textStyle(colors.GreenTosca, 11, FontWeight.w400, TextDecoration.none);

//   //12
//   static TextStyle regular12BaseColor() =>
//       _textStyle(colors.GreenTosca, 12, FontWeight.w400, TextDecoration.none);
//   static TextStyle bold12BaseColor() =>
//       _textStyle(colors.GreenTosca, 12, FontWeight.w600, TextDecoration.none);

//   //14
//   static TextStyle regular14DarkGrey() =>
//       _textStyle(colors.DarkGrey, 14, FontWeight.w400, TextDecoration.none);
// }

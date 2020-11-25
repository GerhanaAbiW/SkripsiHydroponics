import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(height),
    );
  }
}
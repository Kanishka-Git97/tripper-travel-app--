import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {Key? key,
      required this.width,
      required this.text,
      required this.radius,
      required this.height,
      required this.txtColor,
      required this.bgColor,
      required this.borderColor,
      this.onPress})
      : super(key: key);
  final double width;
  final String text;
  final double radius;
  final double height;
  final Color txtColor;
  final Color bgColor;
  final Color borderColor;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: bgColor,
              border: Border.all(color: borderColor)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: txtColor),
            ),
          ),
        ));
  }
}

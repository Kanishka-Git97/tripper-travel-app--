import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({Key? key, required this.width, required this.text})
      : super(key: key);
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      width: width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: subHeadingLight,
        ),
      ),
    ));
  }
}

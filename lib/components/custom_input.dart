import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.keyboardType,
      this.controller,
      this.obscureText = false,
      this.enabled = true})
      : super(key: key);

  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      style: subHeading,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: primaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      controller: controller,
      obscureText: obscureText,
    );
  }
}

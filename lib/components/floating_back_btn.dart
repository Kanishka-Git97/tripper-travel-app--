import 'package:flutter/material.dart';

class FloatingBackBtn extends StatelessWidget {
  const FloatingBackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 35,
        left: 15,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: InkWell(
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              )),
            ),
          ),
        ));
  }
}

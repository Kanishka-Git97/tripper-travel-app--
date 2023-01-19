import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 200,
              child: Image(
                image: AssetImage("assets/images/no_internet.png"),
              ),
            ),
            Text("Oops, No Internet Connection", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            SizedBox(height: 15,),
            Text("Make sure wifi or cellular data is turned\n                on and then try again.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            SizedBox(height: 15,),
            CustomBtn(width: 200, text: "TRY AGAIN", radius: 25, height: 42, txtColor: Colors.white, bgColor: Colors.red, borderColor: Colors.transparent),
          ],
        ),
      ),
    );
  }
}

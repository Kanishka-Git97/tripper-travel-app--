import 'package:flutter/material.dart';

import 'custom_btn.dart';

class NoComments extends StatelessWidget {
  const NoComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
              child: Image(
                image: AssetImage("assets/images/no_comments.png"),
              ),
            ),
            const Text(
              "No Comments to Display",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {},
                child: const CustomBtn(
                    width: 200,
                    text: "ADD COMMENT",
                    radius: 25,
                    height: 42,
                    txtColor: Colors.white,
                    bgColor: Colors.red,
                    borderColor: Colors.transparent)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Sign up to get Start",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://d1bo3i1pvdbydg.cloudfront.net/assets/images/default-avatar.png"))),
                height: 80,
                width: 80,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _imgPicker,
                  child: Icon(
                    Icons.add_circle,
                    color: primaryColor,
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            const CustomInput(
                hintText: "Name",
                labelText: "Name",
                keyboardType: TextInputType.name),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
                hintText: "Email Address",
                labelText: "Email Address",
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              hintText: "Password",
              labelText: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              hintText: "Confirm Password",
              labelText: "Confirm Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const CustomBtn(
                    width: double.maxFinite,
                    text: "SIGN UP",
                    radius: 16,
                    height: 48,
                    txtColor: Colors.white,
                    bgColor: primaryColor,
                    borderColor: Colors.transparent)),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: smallText,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const Text(
                      "SIGN IN",
                      style: smallText,
                    )),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trip",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: primaryColor),
                ),
                Text(
                  "per.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _imgPicker() async {
    late String imgString;
    ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {});
  }
}

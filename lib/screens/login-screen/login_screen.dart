import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_input.dart';
import '../home-screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 170,
            ),
            const Text(
              "Hello Again!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomInput(
                hintText: "Email Address",
                labelText: "Email Address",
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 15,
            ),
            const CustomInput(
              hintText: "Password",
              labelText: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 28,
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
                    text: "SIGN IN",
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
                  "Don't have an account?",
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
                      "SIGN UP",
                      style: smallText,
                    )),
              ],
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trip",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: primaryColor),
                ),
                Text("per.",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
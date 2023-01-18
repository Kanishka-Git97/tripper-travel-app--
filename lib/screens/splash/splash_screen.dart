import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';
import 'package:travel_app_v1/screens/login-screen/login_screen.dart';
import 'package:travel_app_v1/screens/register-screen/register_screen.dart';
import 'package:travel_app_v1/utility/biometric_helper.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showBiometrics = false;

  isBiometricAvailable() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isBiometricAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.webp'), fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const[
                  Text(
                    "Trip with Us",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 56, 56, 56)),
                  ),
                  Icon(
                    Icons.hail_rounded,
                    color: Color.fromARGB(255, 56, 56, 56),
                  )
                ],
              ),
              const Text(
                "Keep on the look out for new features such as ordering food and beverages before or during your travels, as we aim to improve you travel experience.",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    _openRegister(context);
                  },
                  child: CustomBtn(
                      width: double.maxFinite,
                      text: "Sign up",
                      radius: 16,
                      height: 48,
                      txtColor: Colors.white,
                      bgColor: primaryColor.withOpacity(0.9),
                      borderColor: Colors.transparent)),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  _openLogin(context);
                },
                child: CustomBtn(
                    width: double.maxFinite,
                    text: "Sign in",
                    radius: 16,
                    height: 48,
                    txtColor: primaryColor,
                    bgColor: Colors.white.withOpacity(0.8),
                    borderColor: Colors.transparent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openRegister(BuildContext context) async {
    bool connection = await Utility.connectionChecker();
    if (connection) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    } else {
      print("No Internet");
      Utility.notification(
          "No Internet Connection Please Try Again!", context, false);
    }
  }

  _openLogin(BuildContext context) async {
    bool connection = await Utility.connectionChecker();
    if (connection) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // todo: should implement Local Authentication
      bool isAuthenticated = false;
      if (showBiometrics) {
        print("have");
        isAuthenticated = await BiometricHelper().authenticate();
        if(isAuthenticated){
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        }
        else{
          Utility.notification(
          "Unauthorized Access Please try again!", context, false);
        }
      } else {
        print("dont");
      }
    }
  }
}

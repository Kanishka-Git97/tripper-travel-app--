import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg1.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Enjoy the trip \nwith me",
                style: TextStyle(
                  letterSpacing: 1,
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 400,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),);
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),);
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
}

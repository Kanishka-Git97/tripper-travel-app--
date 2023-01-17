import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/controllers/customer_controller.dart';
import 'package:travel_app_v1/provider/user_provider.dart';
import 'package:travel_app_v1/repositories/customer_repository.dart';
import 'package:travel_app_v1/repositories/customer_services.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';
import 'package:travel_app_v1/screens/login-screen/login_screen.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';

import '../../models/customer.dart';

class Dependency extends StatefulWidget {
  Dependency({Key? key}) : super(key: key);

  @override
  State<Dependency> createState() => _DependencyState();
}

class _DependencyState extends State<Dependency> {
  // TextEditing Controller Setup
  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();

  // Depedancy Injection
  var _customerController = CustomerController(CustomerRepository());

  String imgString =
      sampleUser;

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
                ),
                height: 80,
                width: 80,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(5),
                  child: Image.memory(
                    Base64Decoder().convert(imgString),
                    fit: BoxFit.cover,
                  ),
                ),
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
            CustomInput(
              hintText: "Name",
              labelText: "Name",
              keyboardType: TextInputType.name,
              controller: _nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              hintText: "Email Address",
              labelText: "Email Address",
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              hintText: "Password",
              labelText: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              hintText: "Confirm Password",
              labelText: "Confirm Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  _signUp(context);
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
                              builder: (context) => LoginScreen()));
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
    String output;
    ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
      output = Utility.base64String(await img!.readAsBytes());
      setState(() {
        imgString = output;
      });
    });
  }

  _signUp(BuildContext context) async {
    // todo: should check all fields are filled
    // confirm Password
    if (_passwordController.text != _confirmPasswordController.text)
      return Utility.notification("Password Does not Matched!", context, false);
    // Check Connectivity
    bool connection = await Utility.connectionChecker();
    if (connection) {
      // Setup Model
      Customer customer = Customer(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          image: imgString);
      // Send Data to the Server
      if (_customerController.register(customer)) {
        Utility.notification(
            "Successfully Registerd Please Login", context, true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } else {
      // If no Connection
      return Utility.notification(
          "No Internet Connection Please Try Again!", context, false);
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/components/header.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/provider/booking_provider.dart';
import 'package:travel_app_v1/screens/splash/splash_screen.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';

import '../../models/booking.dart';
import '../../models/customer.dart';
import '../../models/location.dart';
import '../../provider/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Customer user = Customer();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    user = context.watch<User>().user;
    List<Booking> bookings = context.watch<BookingProvider>().completedList;
    List<Location> locations = [];
    // Setup All Locations that completed
    for (var booking in bookings) {
      for (var location in booking.tripRef!.locations!) {
        locations.add(location);
      }
    }
    _nameController.text = user.name.toString();
    _emailController.text = user.email.toString();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.grey),
            toolbarHeight: 60,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff383D3C)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: user.image == null || user.image.toString() == "none"
                        ? Image.memory(
                            Base64Decoder().convert(sampleUser),
                            fit: BoxFit.cover,
                          )
                        : Image.memory(
                            Base64Decoder().convert(user.image.toString()),
                            fit: BoxFit.cover),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.redAccent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text("Melbon, Australia")
                        ],
                      ),
                      Text(
                        user.email.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: bookings.length == 0
                                    ? Text("Start Your Journey",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14))
                                    : Text(
                                        "Last Trip | ${bookings.last.tripRef!.title.toString()}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14))),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => SplashScreen()),
                                ),
                              );
                            }),
                            child: const CustomBtn(
                                width: 100,
                                text: "Sign Out",
                                radius: 10.0,
                                height: 50.0,
                                txtColor: primaryColor,
                                bgColor: Colors.white,
                                borderColor: primaryColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "My Journey",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("Expand")
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: bookings.length == 0
                            ? Column(
                                children: const [
                                  SizedBox(
                                    height: 200,
                                    width: double.maxFinite,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/travel.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Start Your Journey",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            : MapBox(
                                locations: locations,
                              ),
                        clipBehavior: Clip.antiAlias,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Update My Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                        hintText: "Full Name",
                        labelText: "Full Name",
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Email",
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                          hintText: "Address",
                          labelText: "Address",
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Login Information Update"),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Password",
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _confirmPasswordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Confirm your update with Current Password"),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Current Password",
                        labelText: "Current Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _currentPasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomBtn(
                          onPress: () {
                            updateProfile(context, user);
                          },
                          width: double.maxFinite,
                          text: "Update Profile",
                          radius: 10.0,
                          height: 50,
                          txtColor: Colors.white,
                          bgColor: primaryColor,
                          borderColor: primaryColor),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  updateProfile(BuildContext context, Customer user) async {
    var temp = user.password;
    if (_passwordController.text != _confirmPasswordController.text)
      return Utility.notification("Password Does not Matched", context, false);
    // want to change password?
    if (_passwordController.text != "" || _passwordController.text != null) {
      if (user.password == _passwordController.text) {
        return Utility.notification(
            "Can not Update Current Password as New Password", context, false);
      } else {
        user.password = _passwordController.text;
      }
    }
    // setup updated model
    if (_nameController.text != "" || _nameController.text != null) {
      user.name = _nameController.text;
    }
    if (_emailController.text != "" || _emailController.text != null) {
      user.email = _emailController.text;
    }
    // validate
    if (_currentPasswordController.text == temp) {
      // save data

    } else {
      return Utility.notification("Verification Failed", context, false);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/components/header.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/constant/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.redAccent,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jesica Jones",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text("Melbon, Australia")
                        ],
                      ),
                      Text(
                        "JesicaJones123@gmail.com",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
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
                                child: Text("Last Booking | Tower of Belem",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14))),
                          ),
                          Spacer(),
                          CustomBtn(
                              width: 100,
                              text: "Sign Out",
                              radius: 10.0,
                              height: 50.0,
                              txtColor: primaryColor,
                              bgColor: Colors.white,
                              borderColor: primaryColor)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "My Journey",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: MapBox(),
                        clipBehavior: Clip.antiAlias,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Update My Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                          hintText: "Full Name",
                          labelText: "Full Name",
                          keyboardType: TextInputType.name),
                      SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                          hintText: "Email",
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                          hintText: "Address",
                          labelText: "Address",
                          keyboardType: TextInputType.text),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Login Information Update"),
                      SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Password",
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Confirm your update with Current Password"),
                      SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hintText: "Current Password",
                        labelText: "Current Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomBtn(
                          width: double.maxFinite,
                          text: "Update Profile",
                          radius: 10.0,
                          height: 50,
                          txtColor: Colors.white,
                          bgColor: primaryColor,
                          borderColor: primaryColor),
                      SizedBox(
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
}

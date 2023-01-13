import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50,),
              Text("Hello!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.black),),
              SizedBox(height: 3,),
              Text("Sign up to get started", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color:  Colors.black),),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 70,
                width: 70,
                child: Image(image: NetworkImage('https://media.istockphoto.com/id/1131164548/vector/avatar-5.jpg?b=1&s=170667a&w=0&k=20&c=JFnFyx9T7gC2VX-lHS4MF2-R73mnDo6Hu66-0GCw6FA='),),
              ),
              const SizedBox(height: 30,),
              const CustomInput(hintText: "Name", labelText: "Name", keyboardType: TextInputType.name),
              const SizedBox(height: 20,),
              const CustomInput(hintText: "Email Address", labelText: "Email Address", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20,),
              const CustomInput(hintText: "Password", labelText: "Password", keyboardType: TextInputType.visiblePassword, obscureText: true,),
              const SizedBox(height: 20,),
              const CustomInput(hintText: "Confirm Password", labelText: "Confirm Password", keyboardType: TextInputType.visiblePassword, obscureText: true,),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                child: const CustomBtn(width: double.maxFinite, text: "SIGN UP", radius: 16, height: 48, txtColor: Colors.white, bgColor: primaryColor, borderColor: Colors.transparent)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Already have an account?", style:smallText,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: const Text("SIGN IN", style:smallText,)),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

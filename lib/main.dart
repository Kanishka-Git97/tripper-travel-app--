import 'package:flutter/material.dart';

import 'package:travel_app_v1/screens/imageview-screen/imageview_screen.dart';

import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';
import 'package:travel_app_v1/screens/login-screen/login_screen.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/screens/map-screen/map_screen.dart';
import 'package:travel_app_v1/screens/payment-screen/payment_screen.dart';

import 'package:travel_app_v1/screens/review-screen/review_screen.dart';

import 'package:travel_app_v1/screens/register-screen/register_screen.dart';
import 'package:travel_app_v1/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // initialRoute: '/',
      // initialRoute: '/payments',

      initialRoute: '/payments',
      //  initialRoute: '/payments',

      routes: {
        '/': (context) => const MainScreen(),
        '/trip_details': (context) => const CurrentBookingDetailsScreen(),
        '/map': (context) => const MapScreen(),
        // '/reviews': (context) => const AllCommentsScreen(),
        '/image': (context) => ImageViewScreen(),
        '/payments': (context) => const PaymentScreen(),
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen()
      },

      theme: ThemeData(
          // Dialog Box Design
          dialogTheme: DialogTheme(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
    );
  }
}

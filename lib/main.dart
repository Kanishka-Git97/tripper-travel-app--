import 'package:flutter/material.dart';

import 'package:travel_app_v1/screens/imageview-screen/imageview_screen.dart';

import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';

import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/screens/map-screen/map_screen.dart';
import 'package:travel_app_v1/screens/review-screen/review_screen.dart';

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

      initialRoute: '/',
      // initialRoute: '/image',
      routes: {
        '/': (context) => const MainScreen(),
        '/trip_details' :(context) => const CurrentBookingDetailsScreen(),
        '/map': (context) => const MapScreen(),
        '/reviews': (context) => const ReviewScreen(),
        '/image': (context) => ImageViewScreen()
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

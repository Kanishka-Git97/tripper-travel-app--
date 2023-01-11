import 'package:flutter/material.dart';
import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';

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
      initialRoute: '/trip_details',
      routes: {
        '/': (context) => const MainScreen(),
        '/trip_details' :(context) => const CurrentBookingDetailsScreen()
        },
    );
  }
}

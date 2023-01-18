import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/provider/trip_provider.dart';
import 'package:travel_app_v1/provider/user_provider.dart';
import 'package:travel_app_v1/screens/comments-review/all_comments_screen.dart';

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
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider<User>(
        create: (_) => User(),
      ),
      Provider(create: (_) => TripProvider())
    ],
    child: const MyApp(),
  ));
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

      initialRoute: '/splash',
      //  initialRoute: '/payments',

      routes: {
        '/': (context) => const MainScreen(),
        // '/map': (context) => MapScreen(),
        '/reviews': (context) => const AllCommentsScreen(),
        '/image': (context) => ImageViewScreen(),
        // '/payments': (context) => const PaymentScreen(),
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => Dependency(),
        '/login': (context) => LoginScreen()
      },

      theme: ThemeData(
          // Dialog Box Design
          dialogTheme: DialogTheme(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
    );

    // return MaterialApp(
    //   title: 'Flutter Travel UI',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //
    //     primaryColor: Color(0xFFF3F5F7),
    //     accentColor: Color(0xFFD8ECF1),
    //     scaffoldBackgroundColor: Color(0xFFF3F5F7),
    //
    //
    //   ),
    //   home: BlogHomeScreen(),
    // );
  }
}

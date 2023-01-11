import 'package:flutter/material.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/screens/map-screen/map_screen.dart';

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
      // initialRoute: '/map',
      routes: {
        '/': (context) => const MainScreen(),
        '/map': (context) => const MapScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/screens/blog_home_screen.dart';

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
       initialRoute: '/blog',
       routes: {'/blog': (context) => BlogHomeScreen()},
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

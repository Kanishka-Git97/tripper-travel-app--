import 'package:flutter/material.dart';
import 'package:travel_app_v1/screens/mybooked-screen/mybooked_screen.dart';
import 'package:travel_app_v1/screens/profile-screen/ProfileScreen.dart';

import '../home-screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /*----added new pages related to bootm navigationbar here-----*/
  final List<Widget> _pages = [
    const HomeScreen(),
    const HomeScreen(),
    const MyBookedScreen(),
    const ProfileScreen(),
  ];

  /*---current page number-----*/
  int _currentPageIndex = 0;

  /*-----page number changer------*/
  void _screenHandler(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _screenHandler,
        selectedItemColor: const Color(0xff2687A4),
        currentIndex: _currentPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: _currentPageIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(
                      Icons.home_outlined,
                      color: Color(0xff2687A4),
                    ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: _currentPageIndex == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline,
                      color: Color(0xff2687A4)),
              label: 'Favourites'),
          BottomNavigationBarItem(
              icon: _currentPageIndex == 2
                  ? const Icon(Icons.calendar_month)
                  : const Icon(Icons.calendar_month_outlined,
                      color: Color(0xff2687A4)),
              label: 'Bookings'),
          BottomNavigationBarItem(
              icon: _currentPageIndex == 3
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline, color: Color(0xff2687A4)),
              label: 'Profile'),
        ],
      ),
    );
  }
}

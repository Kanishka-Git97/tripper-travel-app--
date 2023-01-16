import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:travelapp/widgets/hotel_carousel.dart';
import 'package:travel_app_v1/widgets/hotel_carousel.dart';

import '../../widgets/destination_carousel.dart';

// import '../../widgets/destination_carousel.dart';

class BlogHomeScreen extends StatefulWidget {
  @override
  State<BlogHomeScreen> createState() => _BlogHomeScreenState();
}

class _BlogHomeScreenState extends State<BlogHomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.planeUp,
    FontAwesomeIcons.car,
    FontAwesomeIcons.motorcycle,
    FontAwesomeIcons.ship,
    FontAwesomeIcons.bicycle,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        //blog_home_screen font awesome icons
        height: 50.0,
        width: 55.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).focusColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(15.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xff2687A4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Where would you like to travel?',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),

              // children: <Widget>[
              //   _buildIcon(0),
              //   _buildIcon(1),
              //   _buildIcon(2),
              //   _buildIcon(3),
              // ],
            ),

            SizedBox(height: 20.0),
            DestinationCarousel(),
            // SizedBox(height:20.0),           Hotel Carousel hidden
            // HotelCaousel(),
          ],
        ),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: _currentTab,
      //     onTap: (int value){

      //       setState(() {
      //         _currentTab=value;
      //       });

      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //           color: Color(0xff2687A4),
      //         ),
      //         label: 'Home',
      //       ),

      //       BottomNavigationBarItem(
      //         icon: Icon(
      //       Icons.favorite_outline,
      // color: Color(0xff2687A4)
      //           // Icons.local_pizza,
      //           // size: 30.0,
      //         ),
      //         label: '',
      //       ),

      //       BottomNavigationBarItem(
      //        icon: Icon(Icons.calendar_month_outlined,
      //             color: Color(0xff2687A4)
      //         // icon: CircleAvatar(
      //         //   radius: 15.0,
      //         //   backgroundImage: NetworkImage("https://media.self.com/photos/5f0885ffef7a10ffa6640daa/3:4/w_2945,h_3927,c_limit/travel_plane_corona.jpeg"),
      //         ),
      //         label: '',
      //       ),

      //     ],
      //   ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

import '../../components/extended_travelCard.dart';
import '../../components/regular_travelCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff383D3C)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: Color(0xff2687A4),
                radius: 100,
                child: Text(
                  'HP',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xF9F9F9),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back , Hasantha 👋',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xff2687A4),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/Home/img-1-ella.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black45, BlendMode.darken),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Discover",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text("Discover new places to spend a fun holiday",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                'Frequesntly Visited',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 270.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RegularTravelCard(
                      imageUrl: 'assets/images/img-1.jpeg',
                    ),
                    RegularTravelCard(
                      imageUrl: 'assets/images/img-2.jpeg',
                    ),
                    RegularTravelCard(
                      imageUrl: 'assets/images/img-3.jpeg',
                    ),
                  ],
                ),
              ),
              const Text(
                'On Budget Tour',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 400.0,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    ExtendedTravelCard(
                      imageUrl: ('assets/images/img-1f.jpeg'),
                    ),
                    ExtendedTravelCard(
                      imageUrl: ('assets/images/img-2f.jpeg'),
                    ),
                    ExtendedTravelCard(
                      imageUrl: ('assets/images/img-3f.jpeg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

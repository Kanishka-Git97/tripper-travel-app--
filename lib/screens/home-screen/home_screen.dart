import 'package:flutter/material.dart';

import '../../components/extended_travelCard.dart';
import '../../components/regular_travelCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'empty',
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff2687A4),
                    radius: 100,
                    child: Text(
                      'HP',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xF9F9F9),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back , Hasantha 👋',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xff2687A4),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                            height: 120,
                            width: 120,
                          ),
                          title: Text('Discover',
                              style: TextStyle(color: Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Discover new places to spend a fun holiday',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    child: Text("Discover".toUpperCase(),
                                        style: TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff2687A4)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side:
                                                    BorderSide(color: Colors.white)))),
                                    onPressed: () => null),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Frequesntly Visited',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 270.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RegularTravelCard(),
                    RegularTravelCard(),
                    RegularTravelCard(),
                    RegularTravelCard()
                  ],
                ),
              ),
              Text(
                'On Budget Tour',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 400.0,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    ExtendedTravelCard(),
                    ExtendedTravelCard(),
                    ExtendedTravelCard(),
                    ExtendedTravelCard()
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

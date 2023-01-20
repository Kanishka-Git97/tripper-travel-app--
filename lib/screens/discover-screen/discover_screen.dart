import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/components/discover_travelCard.dart';
import 'dart:convert';
import 'dart:io';

import '../../models/trip.dart';
import '../../provider/trip_provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    Future<List<Trip>> tripData =
        context.watch<TripProvider>().searchTrips(searchText);

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Discover',
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
              color: const Color.fromARGB(0, 249, 249, 249),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        height: 40,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 7),
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Search",
                              fillColor: Color(0xfff2f1f6)),
                        ),
                      ),
                      Icon(Icons.sort)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(28, 0, 0, 0),
                                    spreadRadius: 1),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.apps), Text('All')]),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(28, 0, 0, 0),
                                    spreadRadius: 1),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star_border_outlined),
                                Text('Popular')
                              ]),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(28, 0, 0, 0),
                                    spreadRadius: 1),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite_outline),
                                Text('Recommendation')
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: FutureBuilder<List<Trip>>(
                      future: tripData,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Trip>> snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 300),
                            itemBuilder: (BuildContext context, int index) {
                              return GridTile(
                                child: DiscoverTravelCard(
                                  travelData: snapshot.data![index],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  )
                ],
              )),
        ));
  }
}

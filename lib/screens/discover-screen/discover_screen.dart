import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/discover_travelCard.dart';
import 'package:travel_app_v1/components/regular_travelCard.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
                    'Discover',
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
              color: Color.fromARGB(0, 249, 249, 249),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        height: 40,
                        child: TextField(
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
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 300),
                      children: [
                        DiscoverTravelCard(
                          imageUrl: 'assets/images/img-1d.jpeg',
                        ),
                        DiscoverTravelCard(
                          imageUrl: 'assets/images/img-2d.jpeg',
                        ),
                        DiscoverTravelCard(
                          imageUrl: 'assets/images/img-3d.jpeg',
                        ),
                        DiscoverTravelCard(
                          imageUrl: 'assets/images/img-4d.jpeg',
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}

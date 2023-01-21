import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../screens/current-booking-details-screen/current_booking_details_screen.dart';

class DiscoverTravelCard extends StatelessWidget {
  Trip? travelData;
  DiscoverTravelCard({
    required this.travelData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CurrentBookingDetailsScreen(trip: travelData!)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 1),
            ]),
        width: 200,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 170,
                  height: 152,
                  clipBehavior: Clip.antiAlias,
                  child: Image.memory(
                    Base64Decoder().convert(travelData!.image.toString()),
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [],
                    // image: DecorationImage(
                    //     image: NetworkImage(travelData!.image.toString()),
                    //     fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 20,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(28, 0, 0, 0),
                                spreadRadius: 2),
                          ]),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text('4.8')
                        ],
                      ),
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(travelData!.title.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Row(
                    children: [Text(travelData!.category.toString())],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${travelData!.description.toString().substring(0, 60)}...',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${travelData!.price.toString()}/Person'),
                )),
          ],
        ),
      ),
    );
  }
}

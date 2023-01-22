import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../screens/current-booking-details-screen/current_booking_details_screen.dart';

class ExtendedTravelCard extends StatelessWidget {
  Trip? travelData;
  ExtendedTravelCard({super.key, required this.travelData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CurrentBookingDetailsScreen(trip: travelData!)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2),
            ]),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Container(
                    child: Image.memory(
                      Base64Decoder().convert(travelData!.image.toString()),
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(28, 0, 0, 0),
                              spreadRadius: 2),
                        ])),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(travelData!.title.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                        '${travelData!.description.toString().substring(0, 60)}...'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(travelData!.category.toString()),
                        Row(
                          children: [
                            Text('4.7'),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';

class RegularTravelCard extends StatelessWidget {
  Trip? travelData;
  RegularTravelCard({super.key, required this.travelData});

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
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 170,
                  height: 152,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(28, 0, 0, 0),
                            spreadRadius: 2),
                      ]),
                  child: Image.asset(
                    '',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(28, 0, 0, 0),
                                spreadRadius: 2),
                          ]),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.amber,
                      ),
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(travelData!.title.toString()),
                  Row(
                    children: [
                      Text('4.9'),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Location Name'),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Location'),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('230/Person'),
                )),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';

import '../provider/trip_provider.dart';

class RegularTravelCard extends StatefulWidget {
  Trip travelData;
  RegularTravelCard({super.key, required this.travelData});

  @override
  State<RegularTravelCard> createState() => _RegularTravelCardState();
}

class _RegularTravelCardState extends State<RegularTravelCard> {
  bool _isFavorited = false;
  bool _wishListCheck = false;
  String? _finalStatus;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    int tripId = widget.travelData.id!;
    String travelLocation = widget.travelData.title!;
    print(tripId);
    print(travelLocation);
    Future<String> status = Provider.of<TripProvider>(context, listen: false)
        .checkWishListAvailability(tripId);
    status.then(
      (value) {
        _finalStatus = value;
      },
    );
    print(_finalStatus);
    // Future<int> wishlistAvailability =
    //     context.read<TripProvider>().checkWishListAvailability(tripId);
    // wishlistAvailability.then(
    //   (value) {
    //     print(value);
    //   },
    // );

    // Provider.of<TripProvider>(context, listen: true)
    //     .checkWishListAvailability(tripId);

    //context.read<TripProvider>().checkWishListAvailability(tripId);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CurrentBookingDetailsScreen(trip: widget.travelData!)),
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
                  child: Image.memory(
                    Base64Decoder()
                        .convert(widget.travelData!.image.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: _isFavorited
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: _toggleFavorite,
                    color: _isFavorited ? Colors.amber : null,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.travelData!.title.toString()),
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

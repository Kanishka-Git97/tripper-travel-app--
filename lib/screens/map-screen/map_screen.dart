import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/extended_travelCard.dart';
import 'package:travel_app_v1/components/location_card.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/location.dart';
import 'package:travel_app_v1/screens/current-booking-details-screen/current_booking_details_screen.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key, required this.locations}) : super(key: key);
  List<Location> locations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: MapBox(
              locations: locations,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              width: double.infinity,
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return LocationCard(
                    location: locations[index],
                  );
                },
              ),
            ),
          ),
          Positioned(
              top: 35,
              left: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[700],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // todo: add to back method
                      Navigator.of(context).pop();
                    },
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    )),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

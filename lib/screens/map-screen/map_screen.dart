import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/extended_travelCard.dart';
import 'package:travel_app_v1/components/map_box.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: MapBox(),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              width: double.infinity,
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      margin: EdgeInsets.all(4.0), child: ExtendedTravelCard()),
                  Container(
                      margin: EdgeInsets.all(4.0), child: ExtendedTravelCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

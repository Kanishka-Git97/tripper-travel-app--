import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/extended_travelCard.dart';
import 'package:travel_app_v1/components/location_card.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/constant/constant.dart';

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
                children: const [
                  LocationCard(
                    img:
                        "https://www.boredpanda.com/blog/wp-content/uuuploads/unbelievable-places/unbelievable-places-8.jpg",
                  ),
                  LocationCard(
                    img:
                        "https://imageio.forbes.com/blogs-images/trevornace/files/2015/11/ta-prohm-cambodia-1200x798.jpg?height=472&width=711&fit=bounds",
                  )
                ],
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

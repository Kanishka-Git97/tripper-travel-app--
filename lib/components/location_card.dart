import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/rating_panel.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key, required this.location}) : super(key: key);
  final Location location;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.redAccent,
                image: DecorationImage(
                  image: NetworkImage(location.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Todo: Get Data from Provider or Previous Screen
                  Text(
                    location.title.toString(),
                    style: largeText,
                  ),
                  Text("Sparkels", style: smallText),
                  // RatingPanel(),
                  SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                    width: 130.0,
                    text: "More Details",
                    height: 40.0,
                    txtColor: Colors.blueAccent,
                    bgColor: Colors.white,
                    radius: 50.0,
                    borderColor: primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/rating_panel.dart';
import 'package:travel_app_v1/constant/constant.dart';

import '../models/booking.dart';
import 'package:intl/intl.dart';

class BookedCard extends StatelessWidget {
  BookedCard({Key? key, required this.booking}) : super(key: key);
  final Booking booking;

  String _dateFormatter(String input) {
    String timeStamp = input;
    DateTime date = DateTime.parse(timeStamp);
    var formater = DateFormat('dd MMM yyyy, E');
    String dateOnly = formater.format(date).toString();
    return dateOnly;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _dateFormatter(booking.date.toString()),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Icon(
                Icons.group,
                color: Color(0xff7C8385),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Booked for ${booking.persons} Person",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 100,
                width: 100,
                clipBehavior: Clip.antiAlias,
                child: Image.memory(
                  Base64Decoder().convert(booking.tripRef!.image.toString()),
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                  // image: DecorationImage(
                  //     image: NetworkImage(""), fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.tripRef!.title.toString(),
                    style: subHeading,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                      ),
                      Text(booking.tripRef!.category.toString(), style: text)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingPanel()
                ],
              ),
              Spacer(),
              Center(
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOTAL PRICE",
                style: text,
              ),
              Text("LKR ${booking.persons! * booking.perPerson!}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor))
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

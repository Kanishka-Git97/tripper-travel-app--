import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/rating_panel.dart';
import 'package:travel_app_v1/components/rating_view.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/booking.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.ctx, required this.booking})
      : super(key: key);
  final BuildContext ctx;
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.date.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.greenAccent,
                    image: DecorationImage(
                        image: NetworkImage(""), fit: BoxFit.cover)),
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
                  Text(
                    booking.bookingStatus!.toString(),
                    style: text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingPanel()
                ],
              ),
              Center(
                  child: CustomBtn(
                text: "RATING",
                width: 100.0,
                height: 40.0,
                txtColor: primaryColor,
                bgColor: Colors.white,
                radius: 50,
                borderColor: primaryColor,
                onPress: () => _showMyDialog(context),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  openRating(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/reviews');
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
            child: RatingView(),
          );
        });
  }
}

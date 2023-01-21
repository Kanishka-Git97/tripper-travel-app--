import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/error_card.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/components/review_details_card.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/controllers/review_controller.dart';
import 'package:travel_app_v1/models/comment.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:travel_app_v1/repositories/review_repository.dart';
import 'package:travel_app_v1/screens/comments-review/all_comments_screen.dart';
import 'package:travel_app_v1/screens/imageview-screen/imageview_screen.dart';
import 'package:travel_app_v1/screens/map-screen/map_screen.dart';
import 'package:travel_app_v1/screens/payment-screen/payment_screen.dart';
import 'package:travel_app_v1/screens/review-screen/review_screen.dart';
import 'package:travel_app_v1/utility/rating_helper.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';

class CurrentBookingDetailsScreen extends StatefulWidget {
  CurrentBookingDetailsScreen({Key? key, required this.trip}) : super(key: key);
  Trip trip;

  @override
  State<CurrentBookingDetailsScreen> createState() =>
      _CurrentBookingDetailsScreenState();
}

class _CurrentBookingDetailsScreenState
    extends State<CurrentBookingDetailsScreen> {
  RatingHelper _ratingHelper = RatingHelper();
  final _reviewController = ReviewController(ReviewRepository());
  List<Comment> _comments = [];
  _syncComments() async {
    List<Comment> comments =
        await _reviewController.getComments(widget.trip.id!);
    setState(() {
      _comments = comments;
    });
  }

  @override
  void initState() {
    super.initState();
    _syncComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SizedBox(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 80,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() => Navigator.pop(context)),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xffE89343),
                        ),
                      ),
                    ],
                    pinned: true,
                    elevation: 3,
                    backgroundColor: Colors.white,
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.memory(
                      Base64Decoder().convert(widget.trip.image.toString()),
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    )
                        // Image(
                        //   image: NetworkImage(
                        //       'https://charlieswanderings.com/wp-content/uploads/2020/05/BEAUTIFUL-CASTLES-IN-GERMANY-26-scaled.jpg'),
                        //   width: double.maxFinite,
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.trip.title.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff3C4143),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              _ratingHelper
                                                  .generateRating(
                                                      widget.trip.review!)
                                                  .toString(),
                                              style: text,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFFAE00),
                                              size: 18,
                                            ),
                                          ]),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xffDCE1E2),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.trip.category.toString(),
                                        style: text,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Details",
                            style: subHeading,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.trip.description.toString(),
                            style: text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Up Coming Trip Schedule",
                            style: subHeading,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: List.generate(
                                    widget.trip.schedule!.length,
                                    (index) => Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Chip(
                                              label: Text(
                                            widget.trip.schedule![index].start
                                                .toString(),
                                            style: TextStyle(fontSize: 10),
                                          )),
                                        )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Map",
                                style: subHeading,
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen(
                                              locations: widget.trip.locations!,
                                            )),
                                  );
                                },
                                child: Text(
                                  "See More",
                                  style: text,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 140,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 221, 236, 243),
                            ),
                            child: MapBox(locations: widget.trip.locations),
                            clipBehavior: Clip.antiAlias,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Gallery",
                            style: subHeading,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  widget.trip.locations!.length,
                                  (index) => GestureDetector(
                                        onTap: (() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  ImageViewScreen(
                                                    location: widget
                                                        .trip.locations![index],
                                                  )),
                                            ),
                                          );
                                        }),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          child: Image.memory(
                                            Base64Decoder().convert(widget
                                                .trip.locations![index].image
                                                .toString()),
                                            fit: BoxFit.cover,
                                          ),
                                          // Image(
                                          //   image: NetworkImage(
                                          //       '${widget.trip.locations![index].image.toString()}'),
                                          //   fit: BoxFit.cover,
                                          // ),
                                          width: 150,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(14)),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Reviews",
                                style: subHeading,
                              ),
                              const SizedBox(
                                width: 180,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          AllCommentsScreen()),
                                    ),
                                  );
                                }),
                                child: Text(
                                  "See All",
                                  style: text,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: _comments.length == 0
                                  ? ErrorCard()
                                  : Column(
                                      children: List.generate(
                                        _comments.length,
                                        (index) => Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: ReviewDetailsCard(
                                            comment: _comments[index],
                                          ),
                                        ),
                                      ),
                                    )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(28, 179, 179, 179),
                          spreadRadius: 3)
                    ]),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.trip.price.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2687A4)),
                        ),
                        Text(
                          "Per Person",
                          style: text,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        bool isInternetAvailble =
                            await Utility.connectionChecker();
                        if (isInternetAvailble) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                      trip: widget.trip,
                                    )),
                          );
                        } else {
                          Utility.notification(
                              "No Internet Connection Please Try Again!",
                              context,
                              false);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "JOIN TRIP",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.hail_rounded, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

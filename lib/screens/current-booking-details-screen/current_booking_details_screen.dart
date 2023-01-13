import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/custom_btn.dart';
import 'package:travel_app_v1/components/map_box.dart';
import 'package:travel_app_v1/components/review_details_card.dart';
import 'package:travel_app_v1/constant/constant.dart';

class CurrentBookingDetailsScreen extends StatelessWidget {
  const CurrentBookingDetailsScreen({Key? key}) : super(key: key);

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
                    flexibleSpace: const FlexibleSpaceBar(
                      background: Image(
                        image: NetworkImage(
                            'https://charlieswanderings.com/wp-content/uploads/2020/05/BEAUTIFUL-CASTLES-IN-GERMANY-26-scaled.jpg'),
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
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
                                        "Santa Justa Elevator",
                                        style: TextStyle(
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
                                              "4",
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
                                    children: const [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xffDCE1E2),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Lisbon, Portugal",
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
                          const Text(
                            "Suspendisse pharetra eleifend massa, blandit and aliquam turpis fermentum mattis. Fusce pharetra neque ut on elit vulputate cursus…",
                            style: text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Map",
                            style: subHeading,
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
                            child: MapBox(),
                            clipBehavior: Clip.antiAlias,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Gallery",
                                style: subHeading,
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                "See All",
                                style: text,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  3,
                                  (index) => Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        child: const Image(
                                          image: NetworkImage(
                                              'https://charlieswanderings.com/wp-content/uploads/2020/05/BEAUTIFUL-CASTLES-IN-GERMANY-26-scaled.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        width: 150,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14)),
                                        ),
                                      )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Reviews",
                                style: subHeading,
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                "See All",
                                style: text,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: List.generate(
                              2,
                              (index) => Container(
                                margin: const EdgeInsets.only(bottom: 5.0),
                                child: const ReviewDetailsCard(),
                              ),
                            ),
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
                      children: const [
                        Text(
                          "LKR 8000",
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
                    // const Align(
                    //     alignment: Alignment.centerRight,
                    //     child: CustomBtn(
                    //         width: 278,
                    //         text: "JOIN TRIP",
                    //         radius: 24,
                    //         height: 48,
                    //         txtColor: Colors.white,
                    //         bgColor: primaryColor,
                    //         borderColor: primaryColor)),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "JOIN TRIP",
                              style: TextStyle(
                                  fontSize: 25,
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

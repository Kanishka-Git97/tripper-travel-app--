import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/components/booked_card.dart';
import 'package:travel_app_v1/components/header.dart';
import 'package:travel_app_v1/components/history_card.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/provider/booking_provider.dart';

import '../../models/booking.dart';

class MyBookedScreen extends StatelessWidget {
  const MyBookedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Booking> _bookedList = context.watch<BookingProvider>().bookedList;
    List<Booking> _historyList = context.watch<BookingProvider>().historyList;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Booking Details",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff383D3C)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromARGB(255, 163, 163, 163)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                          indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tabs: const [
                            Tab(
                              text: "Booked",
                            ),
                            Tab(
                              text: "History",
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: TabBarView(children: [
                      Container(
                        // Todo: Booked Item Card Loading
                        child: SingleChildScrollView(
                            child: Column(
                          children: List.generate(
                              _bookedList.length,
                              (index) => BookedCard(
                                    booking: _bookedList[index],
                                  )),
                        )),
                      ),
                      Container(
                        // Todo: History Item Card Loading
                        child: SingleChildScrollView(
                            child: Column(
                                children: List.generate(
                                    _historyList.length,
                                    (index) => HistoryCard(
                                        ctx: context,
                                        booking: _historyList[index]))
                                // [
                                //   HistoryCard(
                                //     ctx: context,
                                //     img:
                                //         "https://globalgrasshopper.com/wp-content/uploads/2012/01/10-of-the-most-beautiful-places-to-visit-in-Laos.jpg",
                                //   ),
                                //   HistoryCard(
                                //     ctx: context,
                                //     img:
                                //         "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg",
                                //   )
                                // ]
                                )),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

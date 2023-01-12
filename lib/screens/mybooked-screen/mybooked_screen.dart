import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/booked_card.dart';
import 'package:travel_app_v1/components/header.dart';
import 'package:travel_app_v1/components/history_card.dart';
import 'package:travel_app_v1/constant/constant.dart';

class MyBookedScreen extends StatelessWidget {
  const MyBookedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          children: [
                            BookedCard(
                              img:
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Torre_Bel%C3%A9m_April_2009-4a.jpg/800px-Torre_Bel%C3%A9m_April_2009-4a.jpg",
                            )
                          ],
                        )),
                      ),
                      Container(
                        // Todo: History Item Card Loading
                        child: SingleChildScrollView(
                            child: Column(children: [
                          HistoryCard(
                            ctx: context,
                            img:
                                "https://globalgrasshopper.com/wp-content/uploads/2012/01/10-of-the-most-beautiful-places-to-visit-in-Laos.jpg",
                          ),
                          HistoryCard(
                            ctx: context,
                            img:
                                "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg",
                          )
                        ])),
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

import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/booked_card.dart';
import 'package:travel_app_v1/components/history_card.dart';
import 'package:travel_app_v1/constant/constant.dart';

class MyBookedScreen extends StatelessWidget {
  const MyBookedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
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
                      children: [BookedCard()],
                    )),
                  ),
                  Container(
                    // Todo: History Item Card Loading
                    child: SingleChildScrollView(
                        child: Column(children: [
                      HistoryCard(
                        ctx: context,
                      ),
                      HistoryCard(
                        ctx: context,
                      )
                    ])),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

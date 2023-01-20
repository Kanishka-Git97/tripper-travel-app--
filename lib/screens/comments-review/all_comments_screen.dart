import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/no_comments.dart';
import 'package:travel_app_v1/components/review_details_card.dart';

class AllCommentsScreen extends StatelessWidget {
  const AllCommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Comments",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff383D3C)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Column(
              children: const [
                // ReviewDetailsCard(),
                SizedBox(
                  height: 5,
                ),
              ],
            );
          }),
          itemCount: 10,
        ),
      ),
    );
  }
}

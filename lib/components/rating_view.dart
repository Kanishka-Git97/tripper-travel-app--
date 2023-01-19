import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_v1/components/custom_input.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/customer.dart';

import '../provider/user_provider.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingPageController = PageController();
  var _ratingPosition = 200.0;
  var _rating = 0;
  @override
  Widget build(BuildContext context) {
    Customer user = context.watch<User>().user;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        // Thankyou Note
        Container(
          height: max(300, MediaQuery.of(context).size.height * 0.3),
          child: PageView(
            controller: _ratingPageController,
            physics: NeverScrollableScrollPhysics(),
            children: [_buildNote(), _causeOfRating(user)],
          ),
        ),
        // Done Button
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: primaryColor,
            child: MaterialButton(
              onPressed: () {},
              child: Text("Done"),
              textColor: Colors.white,
            ),
          ),
        ),
        // Skip Button
        Positioned(
          right: 0,
          child: MaterialButton(
            onPressed: () => _hideDialog(),
            child: const Text("Cancel"),
          ),
        ),
        //Rating Panel
        AnimatedPositioned(
          top: _ratingPosition,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => IconButton(
                      onPressed: () {
                        _ratingPageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                        setState(() {
                          _ratingPosition = 30.0;
                          _rating = index + 1;
                        });
                      },
                      icon: index < _rating
                          ? Icon(
                              Icons.star,
                              size: 32,
                            )
                          : Icon(Icons.star_border, size: 32),
                      color: Color.fromRGBO(212, 175, 55, 100),
                    )),
          ),
          duration: Duration(milliseconds: 300),
        ),
      ]),
    );
  }

  _buildNote() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Thanks for Join with Us",
          style: TextStyle(
              fontSize: 24, color: primaryColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text("We\'d love to get your feedback"),
        Text('How was your journey?'),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  _causeOfRating(Customer user) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircleAvatar(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: user.image == null || user.image.toString() == "none"
                        ? Image.memory(Base64Decoder().convert(sampleUser))
                        : Image.memory(
                            Base64Decoder().convert(user.image.toString()))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
              child: CustomInput(
                  hintText: "Your Thoughts",
                  labelText: "Your Thoughts?",
                  keyboardType: TextInputType.text),
            )
          ],
        ))
      ],
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}

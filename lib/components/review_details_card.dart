import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/comment.dart';

class ReviewDetailsCard extends StatelessWidget {
  const ReviewDetailsCard({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 221, 236, 243),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: CircleAvatar(
                  radius: 30,
                  child: Image.memory(
                    base64Decode(comment.customer!.image.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.customer!.name.toString(),
                    style: heading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    comment.comment.toString(),
                    style: text,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    comment.rate.toString(),
                    style: text,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFFAE00),
                    size: 18,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

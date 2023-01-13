import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

class ReviewDetailsCard extends StatelessWidget {
  const ReviewDetailsCard({Key? key}) : super(key: key);

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
              const SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBOM9ChGm_vp-nX6zF80QAj2wnWNXpMDuZZpUOJe9rjgNcYTRlqX1fLrYqdpHL2yC68hs&usqp=CAU'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Indigo Violet",
                    style: heading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "12 July 2022",
                    style: text,
                  ),
                ],
              ),
              SizedBox(
                width: 180,
              ),
              Text(
                "4",
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
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
                      "Sed egestas, velit at laoreet facilisis, nulla velit laoreet purus.",
                      style: text,
                    ),
          ),
        ],
      ),
      
    );
  }
}

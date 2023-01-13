import 'package:flutter/material.dart';

class ExtendedTravelCard extends StatelessWidget {
  String imageUrl;
  ExtendedTravelCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2),
          ]),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Container(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(28, 0, 0, 0),
                            spreadRadius: 2),
                      ])),
            ),
            Container(
              width: 170,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Santorini'),
                  Text('3 days, 2 nights'),
                  Row(
                    children: [Icon(Icons.add_location), Text('Greece')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('250 person'),
                      Row(
                        children: [
                          Text('4.7'),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

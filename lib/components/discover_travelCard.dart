import 'package:flutter/material.dart';

class DiscoverTravelCard extends StatelessWidget {
  String imageUrl;
  DiscoverTravelCard({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 1),
          ]),
      width: 200,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 170,
                height: 152,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), boxShadow: []),
                child: Image.asset(imageUrl),
              ),
              Positioned(
                  top: 10,
                  left: 20,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(28, 0, 0, 0),
                              spreadRadius: 2),
                        ]),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text('4.8')
                      ],
                    ),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('BEACH'),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.amber,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Location Name'),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Location'),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('230/Person'),
              )),
        ],
      ),
    );
  }
}

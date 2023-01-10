import 'package:flutter/material.dart';

class RegularTravelCard extends StatelessWidget {
  const RegularTravelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 170,
                height: 152,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(28, 0, 0, 0), spreadRadius: 2),
                    ]),
                child: SizedBox(),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(28, 0, 0, 0),
                              spreadRadius: 2),
                        ]),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.amber,
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
                    Text('4.9'),
                    Icon(
                      Icons.star,
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

import 'package:flutter/material.dart';

class Hotel{
  String imageUrl;
  String name;
  String address;
  int price;


  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels=[
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name:'Hotel 0',
    address: '404, Great Street',
    price: 175,
  ),

  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name:'Hotel 1',
    address: '441/9, Great Part Road',
    price: 182,
  ),

  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name:'Hotel 3',
    address: '41, Western Avenue',
    price: 300,
  )
];



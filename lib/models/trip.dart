import 'dart:ffi';

import 'package:travel_app_v1/models/location.dart';
import 'package:travel_app_v1/models/review.dart';
import 'package:travel_app_v1/models/schedule.dart';

class Trip {
  // Table Schema
  static const tblName = 'trip';
  static const colId = 'id';
  static const colTitle = 'title';
  static const colCategory = 'category';
  static const colImage = 'image';
  static const colDescription = 'description';
  static const colPrice = 'price';

  int? id;
  String? title;
  String? category;
  String? image;
  String? description;
  double? price;
  List<Location>? locations;
  List<Schedule>? schedule;
  List<Review>? review;

  Trip(
      {this.id,
      this.title,
      this.category,
      this.image,
      this.description,
      this.price,
      this.locations,
      this.schedule,
      this.review});

  Trip.fromJson(Map<String, dynamic> json) {
    var list = json['locations'] as List;
    List<Location> locationList =
        list.map((e) => Location.fromJson(e)).toList();

    id = int.parse(json['id']);
    title = json['title'];
    category = json['category'];
    image = json['image'];
    description = json['description'];
    price = double.parse(json['price']);
    locations = locationList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = int.parse(this.id.toString());
    data['title'] = this.title;
    data['category'] = this.category;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = double.parse(this.price.toString());
    return data;
  }
}

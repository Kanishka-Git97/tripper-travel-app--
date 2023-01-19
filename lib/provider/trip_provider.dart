import 'package:flutter/cupertino.dart';
import 'package:travel_app_v1/models/wishList.dart';

import '../models/trip.dart';
import '../utility/database_helper.dart';

class TripProvider with ChangeNotifier {
  /*----array to store data coming from database helper-----*/
  List<Trip> _tripData = [];

  /*----getters and setters for above array-----*/
  List<Trip> get tripData => _tripData;

  set tripData(List<Trip> value) {
    _tripData = value;
    notifyListeners();
  }

  /*----singletop instance reference--------*/
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /*------fetch all data and Assign to main array------*/
  Future<void> getAllData() async {
    List<Trip> data = await _dbHelper.queryAll();
    getAllWishList();
    tripData = data;
  }

  /*----fetch all wishlist for certain user----*/
  Future<void> getAllWishList() async {
    List<Map<String, Object?>> data = await _dbHelper.fetchAllWishList(11);
    print(data);
  }
}

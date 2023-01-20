import 'package:flutter/cupertino.dart';
import 'package:travel_app_v1/models/wishList.dart';

import '../models/trip.dart';
import '../utility/database_helper.dart';

class TripProvider with ChangeNotifier {
  late int wishlistcheck;
  /*----array to store data coming from database helper-----*/
  List<Trip> _tripData = [];

  List<Trip> _tripData_searchList = [];

  /*----getters and setters for above array-----*/
  List<Trip> get tripData => _tripData;

  List<Trip> get tripData_searchList => _tripData_searchList;

  set tripData(List<Trip> value) {
    _tripData = value;
    _tripData_searchList = value;
    notifyListeners();
  }

  /*----singletop instance reference--------*/
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /*------fetch all data and Assign to main array------*/
  Future<void> getAllData() async {
    List<Trip> data = await _dbHelper.queryAll();

    tripData = data;
  }

  /*----check wishlist availability for each trip----*/
  Future<String> checkWishListAvailability(int tripId) async {
    return _dbHelper.checkTrip(tripId);

    // wishlistcheck = data;
  }

  /*---------------------- */
  Future<List<Trip>> searchTrips(String searchPara) async {
    return await _dbHelper.searchTrips(searchPara);
  }

  /*----get trips by category-----*/
  Future<List<Trip>> tripsByCategory(String parameter) async {
    if (parameter == "All") {
      return await _dbHelper.queryAll();
    }

    return await _dbHelper.dataBycategory(parameter);
  }
}

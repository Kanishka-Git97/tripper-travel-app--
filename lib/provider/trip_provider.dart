import 'package:flutter/cupertino.dart';

import '../utility/database_helper.dart';

class TripProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  /*------fetch all data------*/
  void getAllData() async {
    _dbHelper.queryAll();

    // return allData;
  }
}

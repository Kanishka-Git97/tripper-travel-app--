import 'package:flutter/cupertino.dart';
import 'package:travel_app_v1/models/customer.dart';

class User with ChangeNotifier {
  Customer _user = Customer();
  Customer get user => _user;
  void setUser(Customer customer) {
    _user = customer;
    notifyListeners();
  }
}

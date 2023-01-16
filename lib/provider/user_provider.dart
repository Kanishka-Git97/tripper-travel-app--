import 'package:flutter/cupertino.dart';
import 'package:travel_app_v1/models/customer.dart';
import 'package:travel_app_v1/repositories/customer_services.dart';

late final CustomerServices services;

class User with ChangeNotifier {
  void register(Customer customer) {
    var response = services.register(customer);
    print(response);
    notifyListeners();
  }
}

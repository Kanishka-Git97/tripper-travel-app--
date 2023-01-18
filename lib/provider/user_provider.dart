import 'package:travel_app_v1/controllers/customer_controller.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';
import '../models/customer.dart';
import 'package:travel_app_v1/repositories/customer_repository.dart';
import 'package:travel_app_v1/repositories/customer_services.dart';
import 'package:travel_app_v1/utility/database_helper.dart';
import 'package:flutter/material.dart';

late final CustomerServices services;

class User with ChangeNotifier {
  // Dependency Injection
  var _customerController = CustomerController(CustomerRepository());
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // States
  Customer _user = Customer();
  Customer get user => _user;

  // void register(Customer customer) {
  //   var response = services.register(customer);
  //   print(response);
  //   notifyListeners();
  // }

  void login(String email, String password, BuildContext context) async {
    bool connection = await Utility.connectionChecker();
    if (connection) {
      _dbHelper.syncData();
      // Online DataFlow
      // get user data from server
      Customer customer = await _customerController.login(email, password);
      if (customer.id == 0) {
        // todo: implement error message handling
        Utility.notification(
            "Password and Email Did not Matched!", context, false);

        print("no user");
      } else {
        // Update Local Database
        bool status = await _dbHelper.insertCustomer(customer);
        if (status) {
          _user = customer;
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    } else {
      // todo: implement offline login flow
      Utility.notification(
          "No Internet Connection Please Try Again!", context, false);
    }

    notifyListeners();
  }
}

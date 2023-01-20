import 'package:provider/provider.dart';
import 'package:travel_app_v1/controllers/customer_controller.dart';
import 'package:travel_app_v1/screens/home-screen/home_screen.dart';
import 'package:travel_app_v1/screens/main-screen/main_screen.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';
import '../models/customer.dart';
import 'package:travel_app_v1/repositories/customer_repository.dart';
import 'package:travel_app_v1/repositories/customer_services.dart';
import 'package:travel_app_v1/utility/database_helper.dart';
import 'package:flutter/material.dart';

import 'booking_provider.dart';

late final CustomerServices services;

enum AuthState { Fail, Error, Success, Pending }

class User with ChangeNotifier {
  // Dependency Injection
  var _customerController = CustomerController(CustomerRepository());
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // States
  Customer _user = Customer();
  Customer get user => _user;

  AuthState _authStat = AuthState.Pending;
  AuthState get authStat => _authStat;

  // void register(Customer customer) {
  //   var response = services.register(customer);
  //   print(response);
  //   notifyListeners();
  // }

  void login(String email, String password, BuildContext context) async {
    print("call login provider");
    bool connection = await Utility.connectionChecker();
    if (connection) {
      print("connection have");
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
       await  _dbHelper.authSync(customer);
        if (status) {
          _user = customer;
        }

        context.read<BookingProvider>().setBookings();
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

  void localAuth(BuildContext context) async {
    List<Map<String, dynamic>> response = await _dbHelper.validateCustomer();
    print(response.length);
    if (response.length > 0) {
      Customer customer = Customer.fromJson(response[0]);
      _user = customer;
      _authStat = AuthState.Success;
       context.read<BookingProvider>().setBookings();
    } else {
      _authStat = AuthState.Error;
      print(_authStat);
    }
    notifyListeners();
  }

  void localAuthReset() {
    _authStat = AuthState.Pending;
    notifyListeners();
  }

  void sync() async {
    await _dbHelper.syncData();
  }
}

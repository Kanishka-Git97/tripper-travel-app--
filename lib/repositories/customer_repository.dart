import 'dart:convert';

import '../models/customer.dart';
import 'customer_services.dart';
import 'package:http/http.dart' as http;

class CustomerRepository implements CustomerServices {
  // Customer Registration
  Future<Customer> register(Customer customer) async {
    print('${customer.toJson().toString()}');
    var url =
        Uri.parse('http://192.168.8.101/travelApp_API/customerRegister.php');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(customer.toJson()));

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      // return Customer.fromJson(body);
    }
    return Customer();
  }

  @override
  Future<Customer> login(String email, String password) async {
    var url = Uri.parse('http://192.168.8.101/travelApp_API/customerLogin.php');
    var body = {"c_email": email, "c_password": password};

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(body));

    if (response.statusCode == 200) {
      if (response.body.contains("invalid")) {
        return Customer(id: 0);
      } else {
        var body = json.decode(response.body);
        return Customer.fromJson(body[0]);
      }
    } else {
      return Customer();
    }
  }
}

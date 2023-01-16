import 'dart:convert';

import '../models/customer.dart';
import 'customer_services.dart';
import 'package:http/http.dart' as http;

class CustomerRepository implements CustomerServices {
  // Customer Registration
  Future<Customer> register(Customer customer) async {
    var url = Uri.parse('http://localhost/travelApp_API/customerRegister.php');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
        },
        body: customer.toJson());
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return Customer.fromJson(body);
    }
    return Customer();
  }
}

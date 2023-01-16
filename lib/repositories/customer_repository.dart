import 'dart:convert';

import '../models/customer.dart';
import 'customer_services.dart';
import 'package:http/http.dart' as http;

class CustomerRepository implements CustomerServices {
  // Customer Registration
  Future<Customer> register(Customer customer) async {
    print('${customer.toJson().toString()}');
    var url =
        Uri.parse('http://192.168.8.104/travelApp_API/customerRegister.php');
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
}

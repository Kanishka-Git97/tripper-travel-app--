import 'package:travel_app_v1/repositories/customer_services.dart';

import '../models/customer.dart';

class CustomerController {
  final CustomerServices services;
  CustomerController(this.services);

  bool register(Customer customer) {
    services.register(customer);
    return true;
  }

  Future<Customer> login(String email, String password) {
    return services.login(email, password);
  }

  Future<bool> update(Customer customer) {
    return services.update(customer);
  }
}

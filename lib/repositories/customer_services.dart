import '../models/customer.dart';

abstract class CustomerServices {
  Future<Customer> register(Customer customer);
}

import '../models/customer.dart';

abstract class CustomerServices {
  Future<Customer> register(Customer customer);
  Future<Customer> login(String email, String password);
  Future<bool> update(Customer customer);
}

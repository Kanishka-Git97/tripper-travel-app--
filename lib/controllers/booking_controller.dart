import 'package:travel_app_v1/models/booking.dart';
import 'package:travel_app_v1/repositories/booking_services.dart';

class BookingController {
  final BookingServices services;
  BookingController(this.services);

  Future<bool> addBooking(Booking booking) async {
    return services.addBooking(booking);
  }
}

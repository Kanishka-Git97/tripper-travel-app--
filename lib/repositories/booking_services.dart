import '../models/booking.dart';

abstract class BookingServices {
  Future<bool> addBooking(Booking booking);
}

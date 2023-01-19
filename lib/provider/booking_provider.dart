import 'package:flutter/cupertino.dart';
import '../models/booking.dart';
import '../utility/database_helper.dart';

final DatabaseHelper _dbHelper = DatabaseHelper.instance;

enum BookingState { Booked, Pending, Cancel, Completed }

class BookingProvider with ChangeNotifier {
  // All Booking State
  List<Booking> _bookings = [];
  List<Booking> get bookings => _bookings;
  // Booked List State
  List<Booking> _bookedList = [];
  List<Booking> get bookedList => _bookedList;
  // History List
  List<Booking> _historyList = [];
  List<Booking> get historyList => _historyList;
  // Completed Booking List
  List<Booking> _completedList = [];
  List<Booking> get completedList => _completedList;

  // Booking State
  BookingState _state = BookingState.Pending;
  BookingState get state => _state;

  Future<void> setBookings() async {
    List<Booking> _data = await _dbHelper.getBookings();
    _bookings = _data;
    _bookedList =
        _data.where((booking) => booking.bookingStatus == 'Booked').toList();
    _historyList = _data
        .where((booking) =>
            booking.bookingStatus == 'Cancel' ||
            booking.bookingStatus == 'Completed')
        .toList();
    _completedList =
        _data.where((booking) => booking.bookingStatus == 'Completed').toList();
    notifyListeners();
    print("Booking Items: ${_bookings.length}.");
  }
}

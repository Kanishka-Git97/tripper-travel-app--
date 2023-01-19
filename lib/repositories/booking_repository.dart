import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/repositories/booking_services.dart';

import '../models/booking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingRepository implements BookingServices {
  @override
  Future<bool> addBooking(Booking booking) async {
    var url = Uri.parse('$baseUrl/add_booking.php');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(booking.toJson()));
    print("Success! in Booking: ${response.statusCode}");
    if (response.statusCode == 200) {
      var reasult = json.decode(response.body);
      if (reasult) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

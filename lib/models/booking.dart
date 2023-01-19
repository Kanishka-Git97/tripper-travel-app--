import 'package:travel_app_v1/models/customer.dart';
import 'package:travel_app_v1/models/trip.dart';

class Booking {
  // Table Schema
  static const tblName = 'booking';
  static const colId = 'id';
  static const colCus = 'customer';
  static const colTrip = 'trip';
  static const colDate = 'date';
  static const colPaymentStat = 'payment_status';
  static const colBookingStat = 'booking_status';
  static const colPerson = 'person';
  static const colPerPerson = 'per_person';

  int? id;
  Customer? customerRef;
  Trip? tripRef;
  String? date;
  String? paymentStatus;
  String? bookingStatus;
  int? persons;
  double? perPerson;

  Booking(
      {this.id,
      this.customerRef,
      this.tripRef,
      this.date,
      this.paymentStatus,
      this.bookingStatus,
      this.persons,
      this.perPerson});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerRef = json['customer_ref'];
    tripRef = json['trip_ref'];
    date = json['date'];
    paymentStatus = json['payment_status'];
    bookingStatus = json['booking_status'];
    persons = json['persons'];
    perPerson = json['per_person'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['customer_ref'] = int.parse(this.customerRef!.id.toString());
    data['trip_ref'] = int.parse(this.tripRef!.id.toString());
    data['date'] = this.date;
    data['payment_status'] = this.paymentStatus;
    data['booking_status'] = this.bookingStatus;
    data['persons'] = this.persons;
    data['per_person'] = this.perPerson;
    return data;
  }
}

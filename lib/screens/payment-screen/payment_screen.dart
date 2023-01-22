import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/controllers/booking_controller.dart';
import 'package:travel_app_v1/models/booking.dart';
import 'package:travel_app_v1/models/schedule.dart';
import 'package:travel_app_v1/models/trip.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_v1/provider/booking_provider.dart';
import 'package:travel_app_v1/repositories/booking_repository.dart';
import 'package:travel_app_v1/utility/database_helper.dart';
import 'package:travel_app_v1/utility/utility_helper.dart';
import '../../components/custom_btn.dart';
import '../../models/customer.dart';
import '../../provider/user_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.trip}) : super(key: key);

  final Trip trip;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Dependency Injection
  var _bookingController = BookingController(BookingRepository());
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  // Variables Defines
  final GlobalKey<SfSignaturePadState> _signatureGlobalKey = GlobalKey();
  var _personCount = 1;
  bool _isDateValid = false;
  bool _isSigned = false;
  String _sign = "";
  Booking booking = Booking();

  @override
  Widget build(BuildContext context) {
    // Setup Trip Cost
    var _perPorsonCost = double.parse(widget.trip.price.toString());
    Customer user = context.watch<User>().user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Book Your Trip",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff383D3C)),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      child: Image.memory(
                        Base64Decoder().convert(widget.trip.image.toString()),
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // image: DecorationImage(
                        //     image: NetworkImage(
                        //         "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg"),
                        //     fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.trip.title.toString(),
                          style: subHeading,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Scheduled Dates",
                          style: TextStyle(fontSize: 10),
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  widget.trip.schedule!.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Chip(
                                            label: Text(
                                          widget.trip.schedule![index].start
                                              .toString(),
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Book your Date",
                      style: subHeading,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 300,
                      child: SfDateRangePicker(
                        onSelectionChanged:
                            (DateRangePickerSelectionChangedArgs args) {
                          _onSelectionChanged(args, context);
                        },
                        selectableDayPredicate: (DateTime dateTime) {
                          if (dateTime.isBefore(DateTime.now())) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                      ),
                    ),
                    const Text(
                      "Billing Information",
                      style: subHeading,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Person Counter
                    Row(
                      children: [
                        const Text("Persons: "),
                        Container(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: _personCounterDecrement,
                                child:
                                    const Icon(Icons.arrow_circle_down_sharp),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(_personCount.toString()),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: _personCounterIncrement,
                                  child: const Icon(
                                    Icons.arrow_circle_up_sharp,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Per Person : ",
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                        Text(" LKR ${_perPorsonCost}",
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("            ",
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                        Text("${_personCount} x ",
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                        Text("${_perPorsonCost * _personCount}",
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Trip Cost: ",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        Text("LKR ${_perPorsonCost * _personCount}",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _showMyDialog,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xff7C8385),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_left_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Signature",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 90,
              )
            ],
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(28, 179, 179, 179),
                        spreadRadius: 3)
                  ]),
              width: double.infinity,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomBtn(
                          onPress: () {
                            _processBooking(context, user);
                          },
                          width: double.maxFinite,
                          text: "PAY LKR ${_perPorsonCost * _personCount}",
                          radius: 24,
                          height: 48,
                          txtColor: Colors.white,
                          bgColor: primaryColor,
                          borderColor: primaryColor)),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  _processBooking(BuildContext context, Customer user) async {
    // Validate Booking Information
    if (!_isSigned || !_isDateValid) {
      return Utility.notification(
          "Required Information are Missing, Please try again", context, false);
    }
    // Complete Booking Model
    booking.bookingStatus = "Booked";
    booking.customerRef = user;
    booking.tripRef = widget.trip;
    booking.paymentStatus = "Paid";
    booking.persons = int.parse(_personCount.toString());
    booking.perPerson = double.parse(widget.trip.price.toString());

    // Check Internet Connection
    bool isConnected = await Utility.connectionChecker();
    if (isConnected) {
      // Process Server Update
      bool isUpdatedServer = await _bookingController.addBooking(booking);
      if (isUpdatedServer) {
        Utility.notification(
            "Successfully Booked your new Trip, Enjoy!", context, true);
        // Update Local Storage
        await _dbHelper.authSync(user);
        context.read<BookingProvider>().setBookings();
        print("Updated");
      } else {
        Utility.notification(
            "Something Went Wrong, You have already Booked this Trip",
            context,
            false);
      }
    } else {
      Utility.notification(
          "No Internet Connection Please Try Again", context, false);
    }
  }

  _onSelectionChanged(
      DateRangePickerSelectionChangedArgs args, BuildContext context) {
    List<Schedule> schedules = widget.trip.schedule!;
    print(args.value);
    DateFormat format = DateFormat("dd/MM/yyyy");
    // DateTime _selectedDate = format.parse(args.value.toString());
    // print(_selectedDate);
    if (schedules.length > 0) {
      var dates = [];
      for (var schedule in schedules) {
        dates.add(format.parse(schedule.start.toString()));
      }
      bool isValid = dates.contains(args.value);
      if (!isValid) {
        Utility.notification("Please Select Valid Date", context, false);
        print("not a valid date");
      } else {
        Utility.notification("Date Selected", context, true);
        booking.date = args.value.toString();
        _isDateValid = true;
        print("valid date: ${booking.date.toString()}");
      }
    } else {
      Utility.notification("No Available Dates for this Trip", context, false);
      _isDateValid = false;
      print("No Availble Dates");
    }
  }

  _personCounterIncrement() {
    setState(() {
      _personCount++;
    });
  }

  _personCounterDecrement() {
    if (_personCount != 1) {
      setState(() {
        _personCount--;
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SfSignaturePad(
                        key: _signatureGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _isSigned = true;
                                _sign =
                                    _signatureGlobalKey.currentState.toString();
                                _hideDialog();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xff7C8385),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.verified_user,
                                      size: 12,
                                    ),
                                    Text("Done")
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _handleSignClear,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xff7C8385),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear_sharp,
                                      size: 12,
                                    ),
                                    Text("Clear")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: _hideDialog,
                          child: Container(
                            child: Icon(Icons.cancel),
                          ),
                        )),
                  ]),
                ],
              ),
            ),
          );
        });
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  _handleSignClear() {
    print("Clear");
    _signatureGlobalKey.currentState!.clear();
  }
}

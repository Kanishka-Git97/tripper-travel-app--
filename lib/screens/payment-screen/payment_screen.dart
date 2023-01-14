import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:travel_app_v1/constant/constant.dart';

import '../../components/custom_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<SfSignaturePadState> _signatureGlobalKey = GlobalKey();
  var _personCount = 1;

  // Setup Trip Cost
  var _perPorsonCost = 8000.00;
  @override
  Widget build(BuildContext context) {
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Trip Name",
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
                                  3,
                                  (index) => const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Chip(
                                            label: Text(
                                          "2023-01-27",
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
                        onSelectionChanged: _onSelectionChanged,
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
                                child: const Icon(Icons.arrow_circle_down_sharp),
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

  _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value);
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
                            Container(
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

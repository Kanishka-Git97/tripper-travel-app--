import 'package:flutter/material.dart';
import 'package:travel_app_v1/constant/constant.dart';

import '../../components/custom_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  _PaymentScreenState() {
    _selectedVal = _memberList[0];
  }

  final _memberList = ["Select", "1", "2", "3", "4", "5", "6", "7"];
  String? _selectedVal = "";
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
          "Payment",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff383D3C)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pick Date",
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 300,
                    color: Colors.amber,
                    child: Text("calander"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Member",
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    isExpanded: false,
                    value: _selectedVal,
                    items: _memberList.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedVal = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    ),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(14))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Amount",
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Per member : ",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                     
                      Text(" LKR 8,000.00",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("            ",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                      Text("5 x ",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                      Text("8,000.00",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total : ",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      Text("LKR 40,000.00",
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(28, 179, 179, 179),
                          spreadRadius: 3)
                    ]),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Trip Cost",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "LKR 40000",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2687A4)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: CustomBtn(
                            width: double.maxFinite,
                            text: "CONFIRM",
                            radius: 24,
                            height: 48,
                            txtColor: Colors.white,
                            bgColor: primaryColor,
                            borderColor: primaryColor)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

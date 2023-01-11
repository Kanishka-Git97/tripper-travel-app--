import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final int id = routeArgs['id'];

    return Scaffold(
      body: Column(
        children: [
          // Header Section
        ],
      ),
    );
  }
}

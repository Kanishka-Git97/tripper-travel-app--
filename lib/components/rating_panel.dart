import 'package:flutter/material.dart';

class RatingPanel extends StatelessWidget {
  const RatingPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.star, color: Color.fromRGBO(212, 175, 55, 100), size: 15),
          Icon(Icons.star, color: Color.fromRGBO(212, 175, 55, 100), size: 15),
          Icon(Icons.star, color: Color.fromRGBO(212, 175, 55, 100), size: 15),
        ],
      ),
    );
  }
}


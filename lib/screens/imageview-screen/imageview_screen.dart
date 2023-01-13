import 'package:flutter/material.dart';
import 'package:travel_app_v1/components/floating_back_btn.dart';

class ImageViewScreen extends StatefulWidget {
  ImageViewScreen({Key? key}) : super(key: key);

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  var _zoom = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.boredpanda.com/blog/wp-content/uuuploads/unbelievable-places/unbelievable-places-8.jpg"),
                  fit: _zoom ? BoxFit.cover : BoxFit.fitWidth),
            ),
          ),
          FloatingBackBtn(),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _zoom = !_zoom;
                    });
                  },
                  icon: const Icon(
                    Icons.zoom_out_map_outlined,
                    color: Colors.black,
                  )),
            ),
          ),
          Positioned(
              top: 30,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      "Teffon Place",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ))
        ]));
  }
}

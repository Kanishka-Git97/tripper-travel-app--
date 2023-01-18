import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/location.dart';

var viewPoints = [
  LatLng(51.5, -0.90),
];

class MapBox extends StatefulWidget {
  MapBox({Key? key, this.locations}) : super(key: key);
  // Locations
  List<Location>? locations;

  @override
  State<MapBox> createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  final List<Marker> markers = [];

  // Make Markers
  _markersBuild() {
    if (widget.locations!.length > 0) {
      List<Marker> _markers = [];
      for (var location in widget.locations!) {
        markers.add(new Marker(
            width: 100.0,
            height: 100.0,
            point: LatLng(double.parse(location.latitude.toString()),
                double.parse(location.longitude.toString())),
            builder: (ctx) => Container(
                  child: const Icon(
                    Icons.location_on_sharp,
                    size: 50,
                    color: primaryColor,
                  ),
                )));
        print(location.longitude.toString());
      }
    }
    // markers = _markers;
  }

  @override
  void initState() {
    super.initState();
    _markersBuild();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(double.parse(widget.locations![1].latitude.toString()),
            double.parse(widget.locations![1].longitude.toString())),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/purna97/clcof8psh001i14qhcvixrtna/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ',
              'id': 'mapbox.mapbox-streets-v8'
            }),
        MarkerLayerOptions(markers: markers
            // [
            //   Marker(
            //       width: 100.0,
            //       height: 100.0,
            //       point: LatLng(51.5, -0.90),
            //       builder: (ctx) => Container(
            //             child: const Icon(
            //               Icons.location_on_sharp,
            //               size: 50,
            //               color: primaryColor,
            //             ),
            //           )),
            //   Marker(
            //       width: 100.0,
            //       height: 100.0,
            //       point: LatLng(51.51, -0.89),
            //       builder: (ctx) => Container(
            //             child: const Icon(
            //               Icons.location_on_sharp,
            //               size: 50,
            //               color: primaryColor,
            //             ),
            //           ))
            // ]
            )
      ],
    );
  }
}

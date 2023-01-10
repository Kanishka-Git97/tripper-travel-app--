import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_app_v1/constant/constant.dart';

var viewPoints = [
  LatLng(51.5, -0.90),
];

class MapBox extends StatelessWidget {
  const MapBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(center: LatLng(51.5, -0.90), zoom: 13.0),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/purna97/clcof8psh001i14qhcvixrtna/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ',
              'id': 'mapbox.mapbox-streets-v8'
            }),
        MarkerLayerOptions(markers: [
          Marker(
              width: 100.0,
              height: 100.0,
              point: LatLng(51.5, -0.90),
              builder: (ctx) => Container(
                    child: const Icon(
                      Icons.location_on_sharp,
                      size: 50,
                      color: primaryColor,
                    ),
                  ))
        ])
      ],
    );
  }
}

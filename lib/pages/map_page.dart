import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(30, 30),
          zoom: 11.0,
        ));
  }
}

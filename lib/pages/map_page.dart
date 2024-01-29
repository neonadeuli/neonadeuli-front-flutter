import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neonadeuli_front_flutter/services/current_loaction_status.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CurrentLocationStatus.getCurrentPosition(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
              zoom: 20.0,
            ),
          );
        }

        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

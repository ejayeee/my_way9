import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Mapboxweb extends StatefulWidget {
  const Mapboxweb({Key? key}) : super(key: key);

  @override
  State<Mapboxweb> createState() => _MapboxwebState();
}

class _MapboxwebState extends State<Mapboxweb> {
  late MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: MapboxMap(
        accessToken:
            'pk.eyJ1IjoiZWpheWVlZSIsImEiOiJjbDVzbHd1bWIwOGtyM2NwMzQxdTloeGh2In0.ZG_zLWjR7rGr7nbHv_Vz-g',
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: () => addCircle(mapController),
        initialCameraPosition: CameraPosition(
            target: LatLng(53.64591449001078, 23.839991860352185), zoom: 14),
      ),
    );
  }

  void addCircle(MapboxMapController mapController) {
    mapController.addCircle(CircleOptions(
      geometry: LatLng(53.64591449001078, 23.839991860352185),
      circleColor: '#23d2aa',
      circleRadius: 15,
    ));
  }
}

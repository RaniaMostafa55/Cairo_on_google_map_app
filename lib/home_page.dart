import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition cairoGovernmentPos = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GoogleMap(
          markers: markers.values.toSet(),
          mapType: MapType.normal,
          //make the map opens on Cairo
          initialCameraPosition: cairoGovernmentPos,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            //make a marker on Cairo position and give it a title
            final marker = Marker(
              markerId: MarkerId('Cairo Government'),
              position: LatLng(30.0444, 31.2357),
              infoWindow: InfoWindow(
                title: 'Cairo Government',
              ),
            );
            setState(() {
              markers[MarkerId('Cairo Government')] = marker;
            });
          },
        ),
      ),
    );
  }
}

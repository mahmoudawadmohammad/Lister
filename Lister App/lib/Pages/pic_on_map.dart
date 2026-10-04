import 'dart:async';
//import 'gh.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  int g ;
  MapSample({required this.g}) ;
  @override
  State<MapSample> createState() => MapSampleState(g: g);
}

class MapSampleState extends State<MapSample> {
  static DateTime e = DateTime(2022);

  int g;

  static Position t = Position(latitude: 1,
      speed: 1,
      altitude: 1,
      heading: 1,
      longitude: 1,
      speedAccuracy: 1,
      accuracy: 2,
      timestamp: e);

  MapSampleState({required this.g});

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.201657, 38.624497),
    zoom: 8.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(t.latitude, t.longitude),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414);
  Set<Marker> _markers = Set();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(children: [


        GoogleMap(
          markers: _markers,
          onTap: (LatLng lat) {
            setState(() {
              _markers.add(Marker(markerId: MarkerId('mark'), position: lat,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure)
              ));
            });
          },
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Container(
            padding: EdgeInsets.all(20),
            child: IconButton(onPressed: () async {
              MapSampleState.t = await _determinePosition();
              _goToTheLake();
              LatLng li = LatLng(
                  MapSampleState.t.latitude, MapSampleState.t.longitude);
              setState(() {
                _markers.add(Marker(markerId: MarkerId('mark'), position: li,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure)
                ));
              });
            },
              icon: Icon(
                  Icons.my_location_outlined, color: Colors.blue, size: 40),)),
      ],),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop(t);
        },
        label: Text('done'),
        icon: Icon(Icons.done
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;


  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
   Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {

    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await  Geolocator.getCurrentPosition();

}

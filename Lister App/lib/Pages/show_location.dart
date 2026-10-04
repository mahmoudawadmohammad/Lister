import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapShow extends StatefulWidget {
 late LatLng o ;
  int g ;
   double x ; double y ;
  MapShow({
    required this.g,
    required this.x,
    required this.y,
}  ) ;
  @override
  State<MapShow> createState() => MapShowState(g: g,x: x,y: y);
}

class MapShowState extends State<MapShow> {
  int g ;
  double x ; double y ;

  MapShowState({required this.y,required this.g,required this.x}) ;
  static late LatLng l =LatLng(32.500934, 36.310629);
  Completer<GoogleMapController> _controller = Completer();
  static final   Marker _markers = (Marker(markerId: MarkerId('mark'), position:l,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose)
  ));
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.734101, 38.314907),
    zoom: 6.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {_markers},
        onCameraIdle: ()
        {
          setState(() {
               l=LatLng(x,y);
          });
        },
        onMapCreated: (GoogleMapController controller)


             {
          _controller.complete(controller);
        },
      ),

      floatingActionButton: FloatingActionButton.extended(

        onPressed: (){
          Navigator.of(context).pop();
        },

        label: Text(g==0?'done':"تم"),
        icon: Icon(Icons.contact_support_outlined),
      ),
    );
  }

}

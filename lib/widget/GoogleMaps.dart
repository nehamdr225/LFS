import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMaps extends StatefulWidget {
 
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {  
  List<Marker> allMarkers =[]; 
  GoogleMapController _controller;

  @override
  void initState(){
    super.initState();
    allMarkers.add(
      Marker(
        markerId:MarkerId('myMarker'),
        draggable: true,
        infoWindow: InfoWindow(title: 'deja vu ktm'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(27.713346, 85.319067),
      )
    );
  }

  @override
    Widget build(BuildContext context) {
      return  GoogleMap(
        
                initialCameraPosition: CameraPosition( 
                  target: LatLng(27.713346, 85.319067),        
                  zoom: 15,
                ),
                markers: Set.from(allMarkers),     
                mapType: MapType.terrain,
                onMapCreated: mapCreated,
    
    );   
  }
 

  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }
  movetoLocation(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(28.2333333, 83.9833333),
                      zoom: 12.0, bearing: 45.0,tilt:45.0),
    ));
  }
}

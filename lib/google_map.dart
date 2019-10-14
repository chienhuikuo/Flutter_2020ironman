import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(25.0339206,121.5636985);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          zoomGesturesEnabled:false,  //縮放手勢
          onMapCreated: _onMapCreated,
          mapType: MapType.normal, 
          compassEnabled: true,  //指北針
          initialCameraPosition: CameraPosition(
            target: _center,  //中心點座標
            zoom: 16.0,  //Camera縮放尺寸，越近數值越大，越遠數值越小，預設為0
            bearing: 30,  //Camera旋轉的角度，方向為逆時針轉動，預設為0
            tilt: 120  //Camera侵斜角度
          ),
        ),
      ),
    );
  }
}
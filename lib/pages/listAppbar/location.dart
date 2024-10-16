import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/HomeController.dart';

class LocationSetting extends StatefulWidget {
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}
class _LocationSettingState extends State<LocationSetting> {
  @override
  void initState() {
    super.initState();
    _getMyLocation();
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  StreamSubscription? _locationSubscription;

  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;
  Set<Polyline> pathPolyline = <Polyline>{};
  List<LatLng> IL = <LatLng>[];
  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(31.1975,29.8925),
    zoom: 16.33,
  );

  Position? _currentPosition;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(child: Text("My Location"))),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(

              mapType: MapType.hybrid,
              initialCameraPosition: initialLocation,
              markers: Set.of((marker != null) ? [marker!] : []),
              circles: Set.of((circle != null) ? [circle!] : []),
              polylines: pathPolyline,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },

            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: MaterialButton(
              child: Text("Set As My Location")
              ,onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                print('${_currentPosition!.longitude}');
                print('${_currentPosition!.latitude}');
                prefs.setDouble('_weather_longitude', _currentPosition!.longitude );
                prefs.setDouble('_weather_latitude', _currentPosition!.latitude );
             //   prefs.setString('_weather_city',name );
            },
            ),
          )
        ],
      ),
      /*
      floatingActionButton: Container(
        padding: EdgeInsets.only(
          right: 35,
        ),
       child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: Icon(Icons.location_searching),
                onPressed: (){
                  _locationTracker = Location(latitude: 31.1975, longitude: 29.8925, timestamp: DateTime.now());
                  getCurrentLocation(_locationTracker);
                }),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
                child: Icon(Icons.close),
                onPressed: () {
                  if (_locationSubscription != null) {
                    _locationSubscription!.cancel();
                  }
                }),
          ],
        ),

      ),

       */
    );
  }

  Future<void> _getMyLocation() async{
    var status = await Permission.location.request();
    if(status == PermissionStatus.granted){
      Geolocator.getPositionStream().listen((Position position){
        setState(() {
          _currentPosition = position;
        });
      });
    }
  }
  }


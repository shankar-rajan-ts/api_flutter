import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final TextEditingController __searchController = TextEditingController();

  double latValue = 11.3753926;
  double longValue = 77.8938889;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
    _getCurrentLocation2();
    // _getCurrentLocation();
    // latValue = 11.3753926;
    // longValue = 77.8938889;
  }

  void _onMapTap(LatLng latLng) {
    // Handle the tapped location
    print('Tapped at: ${latLng}');
    setState(() {
      latValue = latLng.latitude;
      longValue = latLng.longitude;
    });
    print("LAT : $latValue");
    print("LONG : $longValue");
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.380008, 77.8953203),
    zoom: 14.4746,
  );

  Marker _kGooglePlexMarker() {
    return Marker(
      markerId: const MarkerId('_kGooglePlexMarker'),
      infoWindow: const InfoWindow(title: 'shnkarrajan'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(latValue, longValue),
    );
  }

  // final Marker _kGooglePlexMarker = Marker(
  //     // alpha: BitmapDescriptor.hueGreen,R
  //     // rotation: BorderSide.strokeAlignCenter,
  //     // visible: true,
  //     // consumeTapEvents: false,
  //     // draggable: false,
  //     // flat: false,
  //     // anchor: Offset(0.5, 0.5),
  //     // zIndex: BitmapDescriptor.hueRed,
  //     // clusterManagerId: ClusterManagerId('_kGooglePlexMarker'),
  //     // onTap: () {},
  //     // onDrag: (value) {
  //     //   print(value);
  //     // },
  //     // onDragEnd: (value) {
  //     //   print(value);
  //     // },
  //     // onDragStart: (value) {
  //     //   print(value);
  //     // },

  //     markerId: MarkerId('_kGoolePlexMarker'),
  //     infoWindow: InfoWindow(title: 'shnkarrajan'),

  //     // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),

  //     icon: BitmapDescriptor.defaultMarker,
  //     position: LatLng(latValue, 77.8953203));

  static const CameraPosition _kLake = CameraPosition(
      bearing: 180.0,
      target: LatLng(11.380008, 77.8953203),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _klakeMarker = Marker(
      markerId: const MarkerId('_klakeMarker'),
      infoWindow: const InfoWindow(title: 'PeriyaKottapalayam'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: const LatLng(11.4186308, 77.9427329));

  static const Polygon _kPolygon = Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      LatLng(11.4186308, 77.9427329),
      LatLng(11.380008, 77.8953203),
      LatLng(
        30.3800200,
        77.8953305,
      ),
      LatLng(
        12.380300,
        77.8953403,
      ),
    ],
    strokeWidth: 5,
    strokeColor: Colors.pink,
    fillColor: Colors.yellow,
  );

  Future<Object> _getCurrentLocation2() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error("Location Service ");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error("Location Service ");
      }
    }

    _locationData = await location.getLocation();

    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);
    return Location;
  }

  Future<Position> _getCurrentLocation() async {
    print("locationMessage");
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Location Service ");
    }
    print("Service Enabled");
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: __searchController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: "search",
                ),
                onChanged: (value) {},
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          Expanded(
            child: GoogleMap(
              // rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              myLocationEnabled: true,
              // compassEnabled: true,
              // style: AutofillHints.addressCity,
              myLocationButtonEnabled: true,
              mapToolbarEnabled: true,
              // cameraTargetBounds : CameraTargetBounds.unbounded,
              // minMaxZoomPreference : MinMaxZoomPreference.unbounded,
              // myLocationButtonEnabled:BindingBase.debugZoneErrorsAreFatal,
              mapType: MapType.hybrid,
              markers: {_kGooglePlexMarker(), _klakeMarker},
              onTap: _onMapTap,
              // polylines: {
              //   _kPolyline,
              // },
              // polygons: {_kPolygon},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

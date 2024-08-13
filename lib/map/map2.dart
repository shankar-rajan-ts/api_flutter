// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({super.key});

//   @override
//   State<MapSample> createState() => _MapSampleState();
// }

// class _MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   TextEditingController __searchController = TextEditingController();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(11.380008, 77.8953203),
//     zoom: 14.4746,
//   );

//   static final Marker _kGooglePlexMarker = Marker(
//       markerId: MarkerId('_kGoolePlexMarker'),
//       infoWindow: InfoWindow(title: 'shnkarrajan'),
//       // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),

//       icon: BitmapDescriptor.defaultMarker,
//       position: LatLng(11.380008, 77.8953203));

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 180.0,
//       target: LatLng(11.380008, 77.8953203),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   static final Marker _klakeMarker = Marker(
//       markerId: MarkerId('_klakeMarker'),
//       infoWindow: InfoWindow(title: 'PeriyaKottapalayam'),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
//       position: LatLng(11.4186308, 77.9427329));

//   static final Polyline _kPolyline = Polyline(
//       polylineId: PolylineId('_kPolyline'),
//       points: [
//         LatLng(11.4186308, 77.9427329),
//         LatLng(11.380008, 77.8953203),
//       ],
//       width: 5,
//       color: Colors.pink);
//   static final Polygon _kPolygon = Polygon(
//     polygonId: PolygonId('_kPolygon'),
//     points: [
//       LatLng(11.4186308, 77.9427329),
//       LatLng(11.380008, 77.8953203),
//       LatLng(
//         30.3800200,
//         77.8953305,
//       ),
//       LatLng(
//         12.380300,
//         77.8953403,
//       ),
//     ],
//     strokeWidth: 5,
//     strokeColor: Colors.pink,
//     fillColor: Colors.yellow,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: TextFormField(
//                 controller: __searchController,
//                 textCapitalization: TextCapitalization.words,
//                 decoration: InputDecoration(
//                   hintText: "search",
//                 ),
//                 onChanged: (value) {},
//               )),
//               IconButton(onPressed: () {}, icon: Icon(Icons.search))
//             ],
//           ),
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.hybrid,
//               markers: {_kGooglePlexMarker, _klakeMarker},
//               // polylines: {
//               //   _kPolyline,
//               // },
//               // polygons: {_kPolygon},
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: const Text('To the lake!'),
//       //   icon: const Icon(Icons.directions_boat),
//       // ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

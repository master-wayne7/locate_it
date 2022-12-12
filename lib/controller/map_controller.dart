import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../service/database.dart';
// import 'package:locate_it_user_1/database.dart';
// import 'package:location/location.dart';
// import 'package:location_tracker/services/database.dart';

class MapController extends GetxController {
  late GoogleMapController googleMapController;
  RxList<Marker>? markers = RxList<Marker>();
  // RxDouble currentLat = 24.5942497.obs;
  // RxDouble currentLng = 73.7648697.obs;
  final ref = FirebaseDatabase.instance.ref('BUS');
  RxBool buttonsVisibility = false.obs;

  // getCurrentPosition() async {
  //   var currentLocation = await Location().getLocation();
  //   currentLat.value = currentLocation.latitude!;
  //   currentLng.value = currentLocation.longitude!;
  //   print(currentLat.value);
  //   return currentLocation;
  // }

  void setGoogleMapController(GoogleMapController controller) async {
    googleMapController = controller;

    // await getCurrentPosition();
    // await moveToCurrentLocation(LatLng(currentLat.value, currentLng.value));
    await getAllMarkers();
  }

  moveToCurrentLocation(currentPosition) async {
    await googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        zoom: 15,
        target: currentPosition,
      ),
    ));
  }

  getAllMarkers() {
    markers!.clear();
    DatabaseServices().fatchDatabase();
  }

  updateCustomIcon() {
    return BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/icon/bus.png');
  }
}

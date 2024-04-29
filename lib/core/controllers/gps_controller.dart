import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_care/core/database/firebase/firestore_service.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:location/location.dart';

abstract class MyGps {
  static final Location _location = Location();

  static Future<LocationData?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await _location.getLocation();
    return locationData;
  }

  static Future<void> uploadGpsData() async {
    final location = await getLocation();
    final String email = FirebaseAuth.instance.currentUser!.email!;
    final gps = FirebaseService().firestore.collection(FirebaseStrings.gpsCollection).doc(email);
    await gps.set({
      FirebaseStrings.lat: location!.latitude,
      FirebaseStrings.long: location.longitude,
    });
  }

  static Future<void> enableBackgroundGps() async {
    await _location.enableBackgroundMode(enable: true);
  }

  static Future<void> contGps() async {
    _location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });
  }
}

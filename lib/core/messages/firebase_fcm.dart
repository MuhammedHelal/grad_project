import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseFcm {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseMessaging getFcmInstance() {
    return _firebaseMessaging;
  }
}

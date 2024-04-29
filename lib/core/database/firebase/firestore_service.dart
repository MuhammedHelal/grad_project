import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._privateConstructor();
  late FirebaseFirestore _firestore;

  FirebaseService._privateConstructor() {
    _firestore = FirebaseFirestore.instance;
  }

  factory FirebaseService() {
    return _instance;
  }

  void initialize() {
    _firestore = FirebaseFirestore.instance;
  }

  FirebaseFirestore get firestore => _firestore;
}

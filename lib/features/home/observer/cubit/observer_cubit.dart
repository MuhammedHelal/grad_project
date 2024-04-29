import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/database/firebase/firestore_service.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/home/observer/cubit/observer_state.dart';

class ObserverCubit extends Cubit<ObserverState> {
  ObserverCubit() : super(ObserverInitial());
  List<QueryDocumentSnapshot<Map<String, dynamic>>> weekReports = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> stabilityDocs = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> weekSrmDocs = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> weekPreSrmDocs = [];
  String observerEmail = '';
  List observeList = [];
  Future<void> getObserveList() async {
    try {
      emit(ObserverListLoading());
      final res = await FirebaseService().firestore.collection(FirebaseStrings.usersCollection).doc(FirebaseAuth.instance.currentUser!.email).get();
      observeList = res.data()![FirebaseStrings.observers];
      emit(ObserverListSuccess());
    } catch (e) {
      emit(ObserverListFail());
    }
  }
}

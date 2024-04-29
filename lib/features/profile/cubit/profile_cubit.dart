import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/database/firebase/firestore_service.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  User user = FirebaseAuth.instance.currentUser!;
  late Map<String, dynamic> userProfile;
  late bool isObserver;
  late List observers;
  late String observer;
  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final users = FirebaseService().firestore.collection(FirebaseStrings.usersCollection).doc(user.email);
      await users.get().then((value) {
        userProfile = value.data()!;
        isObserver = userProfile[FirebaseStrings.isObserver];
        observers = userProfile[FirebaseStrings.observers];
      });
      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> addObserver() async {
    try {
      final users = FirebaseService().firestore.collection(FirebaseStrings.usersCollection).doc(user.email);
      final current = [...observers, observer];
      observers = current;
      users.update({FirebaseStrings.observers: current});
      emit(ObserverSuccess());
    } catch (e) {
      emit(ObserverError(error: e.toString()));
    }
  }
}

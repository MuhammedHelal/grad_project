import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/database/cache/cache_helper.dart';
import 'package:health_care/core/database/firebase/firestore_service.dart';
import 'package:health_care/core/services/service_locator.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  late String name;
  late String phone;
  late String email;
  late String password;
  late String reEnterPassword;
  late bool isObserver;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> sendEmailFormKey = GlobalKey();

  bool securePassword = true;
  Future<void> signUpWithEmailAndPass() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUserProfile();
      await sendVerifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailState('The account already exists for that email.'));
      } else {
        debugPrint(e.code);
        emit(SignUpFailState(e.code));
      }
    } catch (e) {
      emit(SignUpFailState(e.toString()));
    } //
  }

  Future<void> sendVerifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void toggleSecurePassword() {
    securePassword = !securePassword;
    emit(SecurePasswordState());
  }

  Future<bool> checkAccountType(String email) async {
    DocumentSnapshot userSnapshot = await FirebaseService().firestore.collection(FirebaseStrings.usersCollection).doc(email).get();
    bool isObserver = userSnapshot.get(FirebaseStrings.isObserver);
    await getIt<CacheHelper>().saveData(key: FirebaseStrings.isObserver, value: isObserver);

    return isObserver;
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      isObserver = await checkAccountType(email);

      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailState('No user found for that email.'));
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        emit(SignInFailState('Wrong password provided for that user.'));

        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      } else {
        emit(SignInFailState('Please Check your email and password'));
      }
    } catch (e) {
      emit(SignInFailState(e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    final users = FirebaseFirestore.instance.collection(FirebaseStrings.usersCollection);

    if (isObserver) {
      await users.doc(email).set({
        FirebaseStrings.name: name,
        FirebaseStrings.phone: phone,
        FirebaseStrings.observers: [],
        FirebaseStrings.isObserver: isObserver,
      });
    } else {
      await users.doc(email).set({
        FirebaseStrings.name: name,
        FirebaseStrings.phone: phone,
        FirebaseStrings.observers: [],
        FirebaseStrings.isObserver: isObserver,
      });
    }
  }

  Future<void> resetPassWithLink() async {
    try {
      emit(ResetPassWithLinkLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      emit(ResetPassWithLinkSuccessState());
    } catch (e) {
      emit(ResetPassWithLinkFailState(e.toString()));
    }
  }
}

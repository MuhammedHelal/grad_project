import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/database/cache/cache_helper.dart';
import 'package:health_care/core/services/service_locator.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';
import 'package:health_care/features/auth/presentation/views/login_screen.dart';
import 'package:health_care/features/home/observer/cubit/observer_cubit.dart';
import 'package:health_care/features/home/observer/presentation/widgets/observer_navbar.dart';
import 'package:health_care/features/home/user/widgets/nav_bar.dart';

// This file is based on lefting state up trick
class RootRouteScreen extends StatelessWidget {
  const RootRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        bool isObserver = getIt<CacheHelper>().getData(key: FirebaseStrings.isObserver);
        if (isObserver) {
          return BlocProvider(
            create: (context) => ObserverCubit(),
            child: const ObserverNavBar(),
          );
        } else {
          return const UserNavBar();
        }
      }
    }

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginScreen(),
    );
  }
}

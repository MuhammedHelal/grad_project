import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';
import 'package:health_care/features/auth/presentation/views/login_screen.dart';
import 'package:health_care/features/auth/presentation/views/send_email_screen.dart';
import 'package:health_care/features/auth/presentation/views/signup_screen.dart';
import 'package:health_care/features/auth/presentation/views/welcome_screen.dart';
import 'package:health_care/features/home/observer/cubit/observer_cubit.dart';
import 'package:health_care/features/home/observer/presentation/widgets/observer_navbar.dart';
import 'package:health_care/features/home/user/widgets/nav_bar.dart';
import 'package:health_care/root_route_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const RootRouteScreen(),
  ),
  GoRoute(
    path: AppStrings.signUpRoute,
    builder: (context, state) {
      final bool isObserver = state.extra as bool;

      return BlocProvider(
        create: (context) => AuthCubit()..isObserver = isObserver,
        child: const SignUpScreen(),
      );
    },
  ),
  GoRoute(
    path: AppStrings.signInRoute,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginScreen(),
    ),
  ),
  GoRoute(
    path: AppStrings.welcomeScreenRoute,
    builder: (context, state) => const WelcomeScreen(),
  ),
  GoRoute(
    path: AppStrings.observerNavBarRoute,
    builder: (context, state) => BlocProvider(
      create: (context) => ObserverCubit()..getObserveList(),
      child: const ObserverNavBar(),
    ),
  ),
  GoRoute(
    path: AppStrings.navBarRouteString,
    builder: (context, state) => const UserNavBar(),
  ),
  GoRoute(
    path: AppStrings.forgetPassSendEmailRouteString,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgetPassSendEmail(),
    ),
  ),
]);

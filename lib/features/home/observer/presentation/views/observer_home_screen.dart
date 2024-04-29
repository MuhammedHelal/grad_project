import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/home/observer/cubit/observer_cubit.dart';

class ObserverHomeScreen extends StatelessWidget {
  const ObserverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ObserverCubit observerCubit = BlocProvider.of(context);
    final Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Placeholder(),
    );
  }
}

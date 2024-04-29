import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/home/observer/presentation/views/observer_home_screen.dart';
import 'package:health_care/features/profile/cubit/profile_cubit.dart';
import 'package:health_care/features/profile/views/profile_screen.dart';

class ObserverNavBar extends StatefulWidget {
  const ObserverNavBar({super.key});

  @override
  State<ObserverNavBar> createState() => _ObserverNavBarState();
}

class _ObserverNavBarState extends State<ObserverNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(index),
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarsItems(),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}

Widget _buildScreen(int index) {
  if (index == 0) {
    return const ObserverHomeScreen();
  } else {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserProfile(),
      child: const ProfileScreen(),
    );
  }
}

List<BottomNavigationBarItem> _navBarsItems() {
  return [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: ("Home"),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: ("Profile"),
    ),
  ];
}

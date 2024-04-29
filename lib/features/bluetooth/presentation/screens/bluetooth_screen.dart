import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/resources/styles_manger/styles_manager.dart';
import 'package:health_care/core/services/injection_container.dart' as di;
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_bloc.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_bloc.dart';
import 'package:health_care/features/bluetooth/presentation/screens/health_screen.dart';
import 'package:health_care/features/bluetooth/presentation/screens/safety_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<EspBloc>()),
          BlocProvider(create: (_) => di.sl<RaspberryBloc>()),
        ],
        child: Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 30, start: 30, end: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Hello Mahmoud,",
                    style: getMediumStyle(color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        dividerColor: Colors.white,
                        tabs: [
                          Container(
                            child: const Center(
                              child: Tab(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 5),
                                    Text("Safety"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Tab(
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(width: 5),
                                  Text("Health"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        SafetyScreen(),
                        HealthScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

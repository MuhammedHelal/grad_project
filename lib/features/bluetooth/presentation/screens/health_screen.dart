import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/resources/image_maneger/image_manger.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_bloc.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_event.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_state.dart';
import 'package:health_care/features/bluetooth/presentation/widgets/data_widget.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  late StreamController<EspData> bluetoothDataStream;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EspBloc, EspState>(listener: (context, state) {
      if (state is EspConnected) {
        bluetoothDataStream = state.bluetoothDevice;
      }
    }, builder: (context, state) {
      return ConditionalBuilder(
          condition: state is EspConnected,
          builder: (context) {
            return StreamBuilder(
              stream: bluetoothDataStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("from health screen ${snapshot.data}");
                  String heartRate = snapshot.data!.heartRate;
                  String spo2 = snapshot.data!.spo2;
                  String bloodPressure = snapshot.data!.bloodPressure;
                  String temp = snapshot.data!.temp;

                  // Update your UI using the spo2 value
                  return Column(
                    children: [
                      CustomTabWidget(
                        mainText: "Heart Rate(BPM)",
                        additionalInfo: heartRate ?? "N/A",
                        firstIcon: ImagesManager.heartRate,
                      ),
                      CustomTabWidget(
                        mainText: "SPO2",
                        additionalInfo: spo2 ?? "N/A",
                        firstIcon: ImagesManager.spo2,
                      ),
                      CustomTabWidget(
                        mainText: "Blood Glocuse",
                        additionalInfo: bloodPressure ?? "N/A",
                        firstIcon: ImagesManager.blood,
                      ),
                      CustomTabWidget(
                        mainText: "Blood Pressure",
                        additionalInfo: temp ?? "N/A",
                        firstIcon: ImagesManager.blood,
                      ),
                    ],
                  ); // Example of updating UI with spo2 value
                } else if (snapshot.hasError) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${snapshot.error}'),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            BlocProvider.of<EspBloc>(context).add(ConnectToEsp());
                          },
                          child: const Center(
                            child: Center(child: Text("Connect to Esp")),
                          ),
                        ),
                      )
                    ],
                  ));
                } else {
                  return const CircularProgressIndicator(); // or any other loading indicator
                }
              },
            );
          },
          fallback: (context) {
            return ConditionalBuilder(
              condition: state is EspError,
              builder: (context) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Something Went Wrong! please try again'),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          BlocProvider.of<EspBloc>(context).add(ConnectToEsp());
                        },
                        child: const Center(
                          child: Center(child: Text("Connect to Esp")),
                        ),
                      ),
                    )
                  ],
                ));
              },
              fallback: (context) {
                return ConditionalBuilder(
                    condition: state is EspLoading,
                    builder: (context) {
                      return const Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                          ),
                        ),
                      );
                    },
                    fallback: (context) {
                      return Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              BlocProvider.of<EspBloc>(context).add(ConnectToEsp());
                            },
                            child: const Center(
                              child: Center(child: Text("Connect to Esp")),
                            ),
                          ),
                        ),
                      );
                    });
              },
            );
          });
    });
  }
}

import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/resources/image_maneger/image_manger.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_bloc.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_event.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_state.dart';
import 'package:health_care/features/bluetooth/presentation/widgets/data_widget.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});
  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  late StreamController<RasData> bluetoothDataStream;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RaspberryBloc, RaspberryState>(listener: (context, state) {
      if (state is RaspberryConnected) {
        bluetoothDataStream = state.bluetoothData;
      }
    }, builder: (context, state) {
      return ConditionalBuilder(
          condition: state is RaspberryConnected,
          builder: (context) {
            return StreamBuilder(
              stream: bluetoothDataStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("from health screen ${snapshot.data}");
                  String openEye = snapshot.data!.heartRate;
                  String cigarette = snapshot.data!.spo2;
                  String phone = snapshot.data!.bloodPressure;
                  String seatbelt = snapshot.data!.temp;

                  // Update your UI using the spo2 value
                  return Column(
                    children: [
                      CustomTabWidget(
                        mainText: "Open Eye",
                        additionalInfo: openEye ?? "N/A",
                        firstIcon: ImagesManager.heartRate,
                      ),
                      CustomTabWidget(
                        mainText: "Cigarette",
                        additionalInfo: cigarette ?? "N/A",
                        firstIcon: ImagesManager.spo2,
                      ),
                      CustomTabWidget(
                        mainText: "Phone",
                        additionalInfo: phone ?? "N/A",
                        firstIcon: ImagesManager.blood,
                      ),
                      CustomTabWidget(
                        mainText: "Seatbelt",
                        additionalInfo: seatbelt ?? "N/A",
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
                            BlocProvider.of<RaspberryBloc>(context).add(ConnectToRas());
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
              condition: state is RaspberryError,
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
                          BlocProvider.of<RaspberryBloc>(context).add(ConnectToRas());
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
                    condition: state is RaspberryLoading,
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
                              BlocProvider.of<RaspberryBloc>(context).add(ConnectToRas());
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
/*Column(
              children: [
                CustomTabWidget(
                  mainText: "Open Eye",
                  additionalInfo: currentBluetoothData != null
                      ? currentBluetoothData!.data.toString()
                      : "N/A",
                  firstIcon: ImagesManager.openEye,
                ),
                CustomTabWidget(
                  mainText: "Cigarette",
                  additionalInfo: currentBluetoothData != null
                      ? currentBluetoothData!.data.toString()
                      : "N/A",
                  firstIcon: ImagesManager.ciggrete,
                ),
                CustomTabWidget(
                  mainText: "Phone",
                  additionalInfo: currentBluetoothData != null
                      ? currentBluetoothData!.data.toString()
                      : "N/A",
                  firstIcon: ImagesManager.phone,
                ),
                CustomTabWidget(
                  mainText: "Seatbelt",
                  additionalInfo: currentBluetoothData != null
                      ? currentBluetoothData!.deviceName.toString()
                      : "N/A",
                  firstIcon: ImagesManager.seatBelt,
                ),
              ],
            );*/
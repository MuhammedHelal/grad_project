import 'dart:async';

import 'package:health_care/features/bluetooth/data/model/rasModel.dart';

abstract class RaspberryState {}

class RaspberryInitial extends RaspberryState {}

class RaspberryLoading extends RaspberryState {}

class RaspberryConnected extends RaspberryState {
  final StreamController<RasData> bluetoothData;
  RaspberryConnected({required this.bluetoothData});
  @override
  List<Object> get props => [bluetoothData];
}

class RaspberryError extends RaspberryState {
  String message;
  RaspberryError({required this.message});
  @override
  List<Object> get props => [message];
}

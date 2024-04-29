import 'dart:async';

import 'package:health_care/features/bluetooth/data/model/espModel.dart';

class EspState {}

class EspInitial extends EspState {}

class EspLoading extends EspState {}

class EspConnected extends EspState {
  final StreamController<EspData> bluetoothDevice;
  EspConnected({required this.bluetoothDevice});
  @override
  List<Object> get props => [bluetoothDevice];
}

class EspError extends EspState {
  String message;
  EspError({required this.message});
  @override
  List<Object> get props => [message];
}

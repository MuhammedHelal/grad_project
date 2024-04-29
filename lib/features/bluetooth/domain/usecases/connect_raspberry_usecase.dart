import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';
import 'package:health_care/features/bluetooth/domain/repositories/bluetooth_repository.dart';

class ConnectRaspberryUseCase {
  final BluetoothRepository _bluetoothRepository;

  ConnectRaspberryUseCase(this._bluetoothRepository);

  Future<Either<Failure, StreamController<RasData>>> call() async {
    return await _bluetoothRepository.connectToRaspberry();
  }
}

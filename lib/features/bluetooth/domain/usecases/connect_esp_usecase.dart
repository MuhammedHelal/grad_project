import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/domain/repositories/bluetooth_repository.dart';

class ConnectEspUseCase {
  final BluetoothRepository _bluetoothRepository;

  ConnectEspUseCase(this._bluetoothRepository);

  Future<Either<Failure, StreamController<EspData>>> call() async {
    return await _bluetoothRepository.connectToEsp();
  }
}

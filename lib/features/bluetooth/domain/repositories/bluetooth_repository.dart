import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';

abstract class BluetoothRepository {
  Future<Either<Failure, StreamController<EspData>>> connectToEsp();
  Future<Either<Failure, StreamController<RasData>>> connectToRaspberry();
}

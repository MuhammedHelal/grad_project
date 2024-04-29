import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:health_care/core/errors/exceptions.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/dataSource/source.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';
import 'package:health_care/features/bluetooth/domain/repositories/bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final BluetoothApiConnection bluetoothApiConnection;

  final FlutterBluetoothSerial flutterBlue;

  BluetoothRepositoryImpl({required this.bluetoothApiConnection, required this.flutterBlue});

  @override
  Future<Either<Failure, StreamController<EspData>>> connectToEsp() async {
    // TODO: implement connectToEsp

    try {
      if (await FlutterBluetoothSerial.instance.isEnabled == true) {
        print("jjgb1");
        var espDataStream = await bluetoothApiConnection.connectToEsp();

        // Return the result as a Right with a single-value Stream
        return Right(espDataStream);
      } else {
        return Left(BluetoothFailure());
      }
    } on EmptyException catch (e) {
      print("jjgb2--$e");
      return Left(EmptyFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StreamController<RasData>>> connectToRaspberry() async {
    // TODO: implement connectToRaspberry

    try {
      if (await FlutterBluetoothSerial.instance.isEnabled == true) {
        print("jjgb1");
        var espDataStream = await bluetoothApiConnection.connectToRaspberry();

        // Return the result as a Right with a single-value Stream
        return Right(espDataStream);
      } else {
        return Left(BluetoothFailure());
      }
    } on EmptyException catch (e) {
      print("jjgb2--$e");
      return Left(EmptyFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure());
    }
  }
}

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:health_care/core/errors/exceptions.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';

abstract class BluetoothApiConnection {
  Future<StreamController<EspData>> connectToEsp();
  Future<StreamController<RasData>> connectToRaspberry();
}

class BluetoothApiConnectionImp implements BluetoothApiConnection {
  // late final FlutterBlue flutterBlue;
  late FlutterBluetoothSerial flutterBluePlus;

  BluetoothApiConnectionImp({required this.flutterBluePlus});
  String _espMessageBuffer = '';
  String _rasMessageBuffer = '';

  final StreamController<EspData> _espStreamController = StreamController<EspData>();
  final StreamController<RasData> _rasStreamController = StreamController<RasData>();

  List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>.empty(growable: true);
  @override
  Future<StreamController<EspData>> connectToEsp() async {
    BluetoothConnection? connection;
    print("1");
    try {
      FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
        final existingIndex = results.indexWhere((element) => element.device.address == r.device.address);
        if (existingIndex >= 0) {
          print("2");
          results[existingIndex] = r;
        } else {
          print("3");
          results.add(r);
        }
      }).onDone(() {
        print("4");
        for (int i = 0; i < results.length; i++) {
          print(results[i].device.name);
          print(results[i].device.address);
          print(results[i].device.toString());

          if (results[i].device.name == 'ESP32_test') {
            print("5");
            BluetoothDevice? device = results[i].device;
            BluetoothConnection.toAddress(device.address).then((connection) {
              print("6");
              print('Connected to the device');
              connection.input!.listen(_onEspDataReceived).onDone(() {
                _espStreamController.close();
              });
            }).catchError((error) {
              print('Cannot connect, exception occured');
              print(error + "efe");
            });
          }
        }
      });
      return _espStreamController;
    } catch (e) {
      print("${e}dwdw");
      // Emit BluetoothOffFailure directly from the stream
      throw ServerException();
    }
  }

  @override
  Future<StreamController<RasData>> connectToRaspberry() async {
    // TODO: implement connectToRaspberry
    BluetoothConnection? connection;
    print("1");
    try {
      FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
        final existingIndex = results.indexWhere((element) => element.device.address == r.device.address);
        if (existingIndex >= 0) {
          print("2");
          results[existingIndex] = r;
        } else {
          print("3");
          results.add(r);
        }
      }).onDone(() {
        print("4");
        for (int i = 0; i < results.length; i++) {
          print(results[i].device.name);
          print(results[i].device.address);
          print(results[i].device.toString());

          if (results[i].device.name == 'ESP32_test') {
            print("5");
            BluetoothDevice? device = results[i].device;
            BluetoothConnection.toAddress(device.address).then((connection) {
              print("6");
              print('Connected to the device');
              connection.input!.listen(_onRasDataReceived).onDone(() {
                _rasStreamController.close();
              });
            }).catchError((error) {
              print('Cannot connect, exception occured');
              print(error + "efe");
            });
          }
        }
      });
      return _rasStreamController;
    } catch (e) {
      print("${e}dwdw");
      // Emit BluetoothOffFailure directly from the stream
      throw ServerException();
    }
  }

  void _onEspDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      _espMessageBuffer = dataString.substring(index);
    } else {
      _espMessageBuffer = (backspacesCounter > 0 ? _espMessageBuffer.substring(0, _espMessageBuffer.length - backspacesCounter) : _espMessageBuffer + dataString);
    }
    if (_espMessageBuffer.isNotEmpty && _espMessageBuffer.length > 2) {
      List<String> resultList = _espMessageBuffer.split(',');
      EspData espData = EspData(heartRate: resultList[0], bloodPressure: resultList[1], spo2: resultList[2], temp: "20");
      _espStreamController.add(espData);
    }
    print(_espMessageBuffer);
  }

  void _onRasDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      _rasMessageBuffer = dataString.substring(index);
    } else {
      _rasMessageBuffer = (backspacesCounter > 0 ? _rasMessageBuffer.substring(0, _rasMessageBuffer.length - backspacesCounter) : _rasMessageBuffer + dataString);
    }
    if (_rasMessageBuffer.isNotEmpty && _rasMessageBuffer.length > 2) {
      List<String> resultList = _rasMessageBuffer.split(',');
      RasData rasData = RasData(heartRate: resultList[0], bloodPressure: resultList[1], spo2: resultList[2], temp: "20");
      _rasStreamController.add(rasData);
    }
    print(_rasMessageBuffer);
  }
}

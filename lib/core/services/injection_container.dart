import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/features/bluetooth/data/dataSource/source.dart';
import 'package:health_care/features/bluetooth/data/repositories/bluetooth_repository_impl.dart';
import 'package:health_care/features/bluetooth/domain/repositories/bluetooth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/bluetooth/domain/usecases/connect_esp_usecase.dart';
import '../../features/bluetooth/domain/usecases/connect_raspberry_usecase.dart';
import '../../features/bluetooth/presentation/blocs/esp_bloc/esp_bloc.dart';
import '../../features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc
  sl.registerFactory(() => EspBloc(espUseCase: sl()));
  sl.registerFactory(() => RaspberryBloc(raspberryUseCase: sl()));

// Usecases
  sl.registerLazySingleton(() => ConnectRaspberryUseCase(sl()));
  sl.registerLazySingleton(() => ConnectEspUseCase(sl()));

// Repository
  sl.registerLazySingleton<BluetoothRepository>(() => BluetoothRepositoryImpl(flutterBlue: sl(), bluetoothApiConnection: sl()));

// Datasources
  sl.registerLazySingleton<BluetoothApiConnection>(() => BluetoothApiConnectionImp(flutterBluePlus: sl()));

//! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(sl()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  /*FlutterBluePlus flutterBlue = FlutterBluePlus();
  sl.registerLazySingleton(() => flutterBlue);*/
  FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
  sl.registerLazySingleton(() => flutterBluetoothSerial);
}

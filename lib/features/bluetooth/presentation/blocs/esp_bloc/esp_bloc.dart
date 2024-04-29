import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/model/espModel.dart';
import 'package:health_care/features/bluetooth/domain/usecases/connect_esp_usecase.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_event.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/esp_bloc/esp_state.dart';

class EspBloc extends Bloc<EspEvent, EspState> {
  final ConnectEspUseCase espUseCase;
  EspBloc({required this.espUseCase}) : super(EspInitial()) {
    on<EspEvent>((event, emit) async {
      if (event is ConnectToEsp) {
        emit(EspLoading());
        final failureOrProducts = await espUseCase();
        emit(_mapFailureOrPostsToState(failureOrProducts));
      }
    });
  }
  EspState _mapFailureOrPostsToState(Either<Failure, StreamController<EspData>> either) {
    return either.fold(
      (failure) => EspError(message: mapFailureToMessage(failure)),
      (services) => EspConnected(bluetoothDevice: services),
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "server_error";
      case LoginFailure:
        return "login_error";
      case EmptyFailure:
        return "no_data";
      case OfflineFailure:
        return "no_internet";
      default:
        return "server_error";
    }
  }
}

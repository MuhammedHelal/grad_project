import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/errors/failures.dart';
import 'package:health_care/features/bluetooth/data/model/rasModel.dart';
import 'package:health_care/features/bluetooth/domain/usecases/connect_raspberry_usecase.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_event.dart';
import 'package:health_care/features/bluetooth/presentation/blocs/raspberry_bloc/raspberry_state.dart';

class RaspberryBloc extends Bloc<RaspberryEvent, RaspberryState> {
  ConnectRaspberryUseCase raspberryUseCase;
  RaspberryBloc({required this.raspberryUseCase}) : super(RaspberryInitial()) {
    on<RaspberryEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is ConnectToRas) {
        emit(RaspberryLoading());
        final failureOrProducts = await raspberryUseCase();
        emit(_mapFailureOrPostsToState(failureOrProducts));
      }
    });
  }
  RaspberryState _mapFailureOrPostsToState(Either<Failure, StreamController<RasData>> either) {
    return either.fold(
      (failure) => RaspberryError(message: mapFailureToMessage(failure)),
      (services) => RaspberryConnected(bluetoothData: services),
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

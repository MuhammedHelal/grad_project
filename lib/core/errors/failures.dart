import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class BluetoothOffFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class BluetoothFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class DataErrorFailure extends Failure {
  String message;
  DataErrorFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class EmptyFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class LoginFailure extends Failure {
  @override
  List<Object?> get props => [];
}
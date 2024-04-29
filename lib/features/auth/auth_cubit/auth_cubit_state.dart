sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class SignUpLoadingState extends AuthCubitState {}

final class SignUpSuccessState extends AuthCubitState {}

final class SignUpFailState extends AuthCubitState {
  final String errMessage;

  SignUpFailState(this.errMessage);
}

final class SignInLoadingState extends AuthCubitState {}

final class SignInSuccessState extends AuthCubitState {}

final class SignInFailState extends AuthCubitState {
  final String errMessage;

  SignInFailState(this.errMessage);
}

final class SecurePasswordState extends AuthCubitState {}

final class ResetPassWithLinkLoadingState extends AuthCubitState {}

final class ResetPassWithLinkSuccessState extends AuthCubitState {}

final class ResetPassWithLinkFailState extends AuthCubitState {
  final String errorMessage;

  ResetPassWithLinkFailState(this.errorMessage);
}

class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}

final class ObserverSuccess extends ProfileState {}

final class ObserverError extends ProfileState {
  final String error;

  ObserverError({required this.error});
}

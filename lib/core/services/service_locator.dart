import 'package:get_it/get_it.dart';
import 'package:health_care/core/database/cache/cache_helper.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}

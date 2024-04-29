import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/core/constants/colors.dart';
import 'package:health_care/core/database/cache/cache_helper.dart';
import 'package:health_care/core/database/firebase/firestore_service.dart';
import 'package:health_care/core/routes/app_router.dart';
import 'package:health_care/core/services/injection_container.dart' as di;
import 'package:health_care/core/services/service_locator.dart';

import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseService().initialize();

  await di.init();
  runApp(const MyApp());
}

final kColorScheme = ColorScheme.fromSeed(seedColor: AppColors.bluePrimary);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            backgroundColor: kColorScheme.primary,
            foregroundColor: Colors.white,
          ),
        ),
        colorScheme: kColorScheme,
        useMaterial3: true,
        iconTheme: IconThemeData(
          color: AppColors.bluePrimary.withOpacity(0.9),
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: AppColors.bluePrimary,
              width: 1.8,
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: AppColors.bluePrimary,
              width: 0.3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: AppColors.bluePrimary,
              width: 0.9,
            ),
          ),
          prefixIconColor: AppColors.bluePrimary.withOpacity(0.9),
          suffixIconColor: AppColors.bluePrimary.withOpacity(0.9),
        ),
      ),
    );
  }
}

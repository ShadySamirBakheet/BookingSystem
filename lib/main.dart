import 'package:booking_system/data/repository/database_repository.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/app_router.dart';
import 'package:booking_system/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DatabaseRepository().initDb();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // <- change the path of the translation files
      fallbackLocale: const Locale('en'),
      startLocale: Locale(isEn ? 'en' : 'ar'),
      useOnlyLangCode: true,

      //  --- useFallbackTranslations: true,
      child: BookingSystemApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class BookingSystemApp extends StatelessWidget {
  final AppRouter appRouter;

  const BookingSystemApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppThemes().lightTheme,
      darkTheme: AppThemes().darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

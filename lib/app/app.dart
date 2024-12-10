import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sos_mobile/app/global_tapped_builder.dart';
import 'package:sos_mobile/config/router/app_router.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/core/helper/local_data/storge_local.dart';
import 'package:sos_mobile/core/utils/log/app_logger.dart';
import 'package:sos_mobile/di/di.dart';
import 'package:sos_mobile/features/login/presentation/bloc/login_bloc.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import '../config/theme/theme_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<LoginBloc>()),
        BlocProvider(create: (_) => getIt.get<ThemeController>()),
      ],
      child: BlocBuilder<ThemeController, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            scrollBehavior: const MaterialScrollBehavior(),
            routerConfig: getIt.get<AppRouter>().config(),
            theme: context.read<ThemeController>().lightTheme,
            darkTheme: context.read<ThemeController>().darkTheme,
            themeMode: themeMode,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            builder: (_, child) => GlobalTappedBuilder(child: child!),
          );
        },
      ),
    );
  }
}

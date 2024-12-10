import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sos_mobile/app/app.dart';
import 'package:sos_mobile/core/utils/log/app_logger.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import 'app/app_initializer.dart';
import 'core/constants/constants.dart';
import 'core/helper/local_data/storge_local.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

void _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer().init();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    String languages =
        LocalStorage.getStringValue(SharedPreferenceKeys.languages);
    if (languages != "en") {
      LocaleSettings.instance.setLocale(AppLocale.km);
    } else {
      LocaleSettings.instance.setLocale(AppLocale.en);
    }
  });
  await Future.delayed(const Duration(milliseconds: 200));
  runApp(TranslationProvider(child: const MyApp()));
}

void _reportError(Object error, StackTrace stack) {
  error.logE(stackTrace: stack);
}

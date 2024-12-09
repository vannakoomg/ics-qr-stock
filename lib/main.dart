import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sos_mobile/app/app.dart';
import 'package:sos_mobile/core/utils/log/app_logger.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import 'app/app_initializer.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

void _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer().init();
  runApp(TranslationProvider(child: const MyApp()));
}

void _reportError(Object error, StackTrace stack) {
  error.logE(stackTrace: stack);
}

// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/core/helper/local_data/storge_local.dart';

import '../../core/config/theme_config.dart';
import '../../di/di.dart';

@lazySingleton
class ThemeController extends Cubit<ThemeMode> {
  ThemeController() : super(_getInitialTheme());

  final _theme = getIt.get<ThemeConfig>();

  ThemeData get lightTheme => _theme.lightTheme;
  ThemeData get darkTheme => _theme.darkTheme;

  bool get isLight => state == ThemeMode.light;
  String get themeMode => '';
  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  void toggleThemeChange() {
    String theme = LocalStorage.getStringValue(SharedPreferenceKeys.theme);
    if (theme == "light") {
      LocalStorage.storeData(key: SharedPreferenceKeys.theme, value: "dark");
      changeTheme(ThemeMode.dark);
    } else {
      LocalStorage.storeData(key: SharedPreferenceKeys.theme, value: "light");
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      changeTheme(
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
    }
    // if (theme == "system") {
    //   LocalStorage.storeData(key: SharedPreferenceKeys.theme, value: "light");
    //   changeTheme(ThemeMode.light);
    // }
  }

  static ThemeMode _getInitialTheme() {
    String theme = LocalStorage.getStringValue(SharedPreferenceKeys.theme);
    if (theme.isEmpty) {
      theme = 'light';
      LocalStorage.storeData(key: SharedPreferenceKeys.theme, value: "light");
    }
    if (theme == "system") {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }
    if (theme == "dark") {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}

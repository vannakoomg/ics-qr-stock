import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class ThemeConstants {
  static PageTransitionsTheme pageTransitionsTheme = const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static const BottomNavigationBarThemeData _baseBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontSize: 16),
    unselectedLabelStyle: TextStyle(fontSize: 16),
  );

  static final moonLightToken = MoonTokens.light.copyWith(
    colors: MoonColors.light.copyWith(
        // piccolo: ColorConstants.primaryLight,
        // beerus: ColorConstants.secondaryLight,
        ),
  );

  static const AppBarTheme lightAppBar = AppBarTheme(
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  );

  static BottomNavigationBarThemeData lightBottomNavigationBarTheme =
      _baseBottomNavigationBarTheme.copyWith(
    backgroundColor: Colors.white,
    elevation: 0,
  );

  static BottomNavigationBarThemeData darkBottomNavigationBarTheme =
      _baseBottomNavigationBarTheme.copyWith();

  /// Dark Token
  static final moonDarkToken = MoonTokens.dark.copyWith();

  static AppBarTheme darkAppBar = const AppBarTheme(
    surfaceTintColor: Colors.transparent,
  );
}

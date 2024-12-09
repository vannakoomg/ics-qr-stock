import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import 'theme_constants.dart';

final baseLightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  pageTransitionsTheme: ThemeConstants.pageTransitionsTheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: ThemeConstants.lightAppBar,
  bottomNavigationBarTheme: ThemeConstants.lightBottomNavigationBarTheme,
  extensions: <ThemeExtension<dynamic>>[
    MoonTheme(tokens: ThemeConstants.moonLightToken),
  ],
);

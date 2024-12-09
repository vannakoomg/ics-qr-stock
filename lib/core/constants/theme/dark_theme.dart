import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import 'theme_constants.dart';

final baseDarkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: ThemeConstants.darkAppBar,
  pageTransitionsTheme: ThemeConstants.pageTransitionsTheme,
  bottomNavigationBarTheme: ThemeConstants.darkBottomNavigationBarTheme,
  extensions: <ThemeExtension<dynamic>>[
    MoonTheme(
      tokens: ThemeConstants.moonDarkToken,
    ),
  ],
);

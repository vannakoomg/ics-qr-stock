import 'package:flutter/material.dart';
import 'package:sos_mobile/config/theme/theme_controller.dart';
import 'package:sos_mobile/di/di.dart';

class GlobalTappedBuilder extends StatelessWidget {
  final Widget? child;
  const GlobalTappedBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapped,
      onDoubleTap: _onDoubleTapped,
      child: child,
    );
  }

  void _onDoubleTapped() {
    // getIt.get<ThemeController>().toggleThemeChange();
  }

  void _onTapped() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

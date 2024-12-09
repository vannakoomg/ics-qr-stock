import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final bool disable;
  final Color colors;
  final bool outline;
  final MoonButtonSize buttonSize;
  final bool isFullWidth;
  final Widget? trailing;

  const CustomButtom({
    super.key,
    required this.title,
    required this.onTap,
    this.outline = false,
    this.buttonSize = MoonButtonSize.lg,
    this.colors = Colors.black,
    this.disable = false,
    this.isFullWidth = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return MoonFilledButton(
      trailing: trailing,

      // decoration: BoxDecoration(
      //     // borderRadius: BorderRadius.circular(50),
      //     color: outline
      //         ? Colors.transparent
      //         : disable
      //             ? context.moonColors!.beerus
      //             : context.moonColors!.chichi,
      //     border: Border.all(
      //         color: outline ? Colors.black : Colors.transparent, width: 0.5)),
      // borderRadius: BorderRadius.circular(8),
      buttonSize: buttonSize,
      isFullWidth: isFullWidth,
      // borderWidth: 0.5,
      // textColor: outline ? Colors.black : Colors.white,
      label: Text(title),
      onTap: () {
        onTap!();
      },
    );
  }
}

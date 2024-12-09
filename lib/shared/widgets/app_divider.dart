import 'package:flutter/material.dart';
import 'package:sos_mobile/core/constants/constants.dart';

class AppDivider extends Divider {
  const AppDivider({
    super.key,
    super.thickness,
    super.color = Colors.black12,
    super.indent = kPadding2,
    super.endIndent = kPadding2,
  }) : super(height: 0);

  const AppDivider.normal({
    Key? key,
    final Color? color,
  }) : this(key: key, thickness: .2, color: color, indent: 0, endIndent: 0);

  const AppDivider.small({
    Key? key,
    final Color? color,
  }) : this(key: key, thickness: .2, color: color);

  const AppDivider.medium({
    Key? key,
    Color? color,
  }) : this(key: key, thickness: .5, color: color);

  const AppDivider.large({
    Key? key,
    Color? color,
  }) : this(key: key, color: color);
}

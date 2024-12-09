// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/gen/assets.gen.dart';

class CustomGmailCard extends StatelessWidget {
  final GestureTapCallback ontap;
  const CustomGmailCard({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return MoonOutlinedButton(
      buttonSize: MoonButtonSize.lg,
      isFullWidth: true,
      onTap: ontap,
      showPulseEffect: false,
      leading: SvgPicture.asset(
        Assets.svg.gmail.path,
        // color: Colors.black,
        height: 16,
        width: 16,
      ),
      label: Text(
        'Login with Gmail',
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

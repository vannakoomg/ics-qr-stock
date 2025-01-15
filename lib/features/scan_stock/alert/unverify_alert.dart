import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import '../../../core/constants/constants.dart';
import '../../../gen/i18n/translations.g.dart';

class UnverifyAlert extends StatefulWidget {
  const UnverifyAlert({
    super.key,
  });

  static Future<bool> show({
    required BuildContext context,
  }) async =>
      await showDialog(
        context: context,
        builder: (_) => const UnverifyAlert(),
      );

  @override
  State<UnverifyAlert> createState() => _UnverifyAlertState();
}

class _UnverifyAlertState extends State<UnverifyAlert> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: kPadding2),
      contentPadding: const EdgeInsets.all(kPadding2 * 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              t.scan.unverifyDesc,
              style: context.moonTypography!.body.text18,
              textAlign: TextAlign.center,
            ),
            kPadding2.gap,
            MoonButton(
                backgroundColor: AppColor.warningColor,
                label: Text(
                  t.common.confirm,
                  style: context.moonTypography!.body.text14
                      .copyWith(color: Colors.white),
                ),
                buttonSize: MoonButtonSize.sm,
                onTap: () {
                  Navigator.pop(context, true);
                })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:moon_design/moon_design.dart';

import '../../../../core/constants/constants.dart';

class ScanDrobdownChill extends StatelessWidget {
  final String title;
  final Function ontap;
  const ScanDrobdownChill(
      {super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.all(kPadding2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.moonColors!.beerus)),
        width: double.infinity,
        child: Text(
          title,
          style: context.moonTypography!.body.text16
              .copyWith(color: context.moonColors!.trunks),
        ),
      ),
    );
  }
}

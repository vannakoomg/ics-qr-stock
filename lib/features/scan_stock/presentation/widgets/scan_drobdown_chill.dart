import 'package:flutter/cupertino.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/utils/widgets/custom_textfile.dart';

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
        child: CustomTextfield(
          hintText: title,
          controller: TextEditingController(text: title),
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sos_mobile/core/helper/fuction.dart';

class CustomBack extends StatelessWidget {
  final Function? ontap;
  final bool isClose;
  const CustomBack({super.key, this.ontap, this.isClose = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap == null
          ? () {
              unFocus();
              Navigator.pop(context);
            }
          : () {
              ontap?.call();
            },
      child: isClose
          ? Icon(Icons.close_rounded)
          : Icon(
              Platform.isAndroid
                  ? Icons.arrow_back_rounded
                  : Icons.arrow_back_ios_new_rounded,
              size: 26,
            ),
    );
  }
}

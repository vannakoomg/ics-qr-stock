import 'package:flutter/material.dart';

import '../../constants/app_colors_constants.dart';

void customshowDialog(BuildContext context, String title) {
  showDialog<void>(
    barrierDismissible: false,
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          backgroundColor: AppColor.secondnaryColor,
          alignment: Alignment.center,
          title: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.surface, fontSize: 22),
          )),
        ),
      );
    },
  );
}

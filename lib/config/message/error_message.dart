import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(kPadding2),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(kPadding2),
                  decoration: BoxDecoration(
                      color: context.moonColors!.goku,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                    children: [
                      const Icon(
                        MoonIcons.generic_info_24_regular,
                        size: 50,
                      ),
                      Text(
                        t.common.errorGenerel,
                        style: context.moonTypography!.body.text16,
                      ),
                      kPadding.gap,
                      Text(
                        message,
                        style: context.moonTypography!.body.text16,
                      ),
                      kPadding2.gap,
                      MoonButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: AppColor.primaryColor,
                        textColor: Colors.white,
                        label: const Text("Back"),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomTagCard extends StatelessWidget {
  final String title;
  final Function? ontap;
  final bool isOnSearch;
  final bool isTheSame;
  const CustomTagCard({
    super.key,
    required this.title,
    this.isOnSearch = true,
    this.isTheSame = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOnSearch == true) {
          ontap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
        decoration: BoxDecoration(
          color: isTheSame == true
              ? const Color.fromARGB(255, 11, 120, 150)
              : context.moonColors?.beerus,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Wrap(
          children: [
            Text(
              title,
              style: context.moonTypography!.body.text12.copyWith(
                  color: isTheSame == true
                      ? Colors.white
                      : context.moonColors!.trunks),
            ),
            if (isOnSearch != true)
              GestureDetector(
                onTap: () {
                  if (ontap != null) {
                    ontap!();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 0, left: 4),
                  height: 15,
                  width: 15,
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

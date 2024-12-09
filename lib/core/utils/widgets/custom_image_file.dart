import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sos_mobile/core/constants/app_colors_constants.dart';

class CustomImageFile extends StatelessWidget {
  final File? file;
  final Function ontapPickImage;
  final Function ontapClearImage;

  const CustomImageFile(
      {super.key,
      this.file,
      required this.ontapPickImage,
      required this.ontapClearImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 100,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: GestureDetector(
              onTap: () {
                ontapPickImage();
              },
              child: Container(
                height: 120,
                width: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(color: AppColor.mainColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    file != null
                        ? Image.file(
                            file!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: 80,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
          if (file != null)
            Positioned(
              right: 15,
              top: 2,
              child: GestureDetector(
                onTap: () {
                  debugPrint("asfdadsf");
                  ontapClearImage();
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Theme.of(context).colorScheme.onTertiary,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 15,
                    color: AppColor.mainColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

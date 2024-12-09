import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/core/extension/string_extension.dart';

class CustomCachedImageCircle extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Border? border;
  const CustomCachedImageCircle({
    super.key,
    required this.image,
    this.borderRadius,
    this.height,
    this.border,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return image.isNotEmptyOrNull
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: image!,
              height: height,
              width: width,
              fit: BoxFit.cover,
              placeholder: (_, __) => SizedBox(
                height: height,
                width: width,
              ),
              errorWidget: (_, __, error) => Container(
                decoration: const BoxDecoration(),
                height: height,
                width: width,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

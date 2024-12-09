import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomAvatar extends StatelessWidget {
  final String image;
  final double high;
  final double width;
  final double radius;
  const CustomAvatar({
    super.key,
    required this.image,
    this.high = 40,
    this.width = 40,
    this.radius = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: high,
      width: width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 0.5, color: context.moonColors!.beerus),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              image,
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}

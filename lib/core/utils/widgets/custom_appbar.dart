import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/core/utils/widgets/custom_back.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final Widget leading;
  final bool isClose;
  const CustomAppBar({
    super.key,
    this.action,
    required this.title,
    this.isClose = false,
    this.leading = const CustomBack(),
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(30.0), // Adjust the height as needed
      child: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: preferredSize.height,
        leadingWidth: 40,
        leading: CustomBack(
          isClose: isClose,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: context.moonTypography!.heading.text16
              .copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kPadding),
            child: action,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}

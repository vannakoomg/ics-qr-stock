import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    super.key,
    required this.title,
    this.actions,
  }) : preferredSize = _PreferredAppBarSize(null, null);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const _LeadingButton(),
      titleSpacing: 0,
      title: Text(title),
      actions: actions,
    );
  }

  @override
  final Size preferredSize;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _LeadingButton extends StatelessWidget {
  const _LeadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MoonButton.icon(
      showPulseEffect: false,
      showBorder: false,
      showPulseEffectJiggle: false,
      showScaleEffect: false,
      showFocusEffect: false,
      buttonSize: MoonButtonSize.lg,
      onTap: () => Navigator.maybePop(context),
      icon: const Icon(
        MoonIcons.arrows_left_short_24_regular,
        size: 30,
      ),
    );
  }
}

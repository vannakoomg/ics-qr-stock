import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';

class CustomOffOnSetting extends StatefulWidget {
  final String tilte;
  final bool value;
  final Function onChanged;
  const CustomOffOnSetting(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.tilte});

  @override
  State<CustomOffOnSetting> createState() => _CustomOffOnSettingState();
}

class _CustomOffOnSettingState extends State<CustomOffOnSetting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.tilte,
              style: context.moonTypography!.body.text16
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          MoonSwitch(
            value: widget.value,
            onChanged: (value) {
              widget.onChanged(!widget.value);
            },
          )
        ],
      ),
    );
  }
}

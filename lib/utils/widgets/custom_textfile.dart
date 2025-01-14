import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class CustomTextfield extends StatelessWidget {
  final bool isBorder;
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool autofocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final Color? color;
  final double radius;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final bool isDense;
  final bool readOnly;

  final bool expands;
  final double? height;

  final Widget? trailing;
  // final EdgeInsetsGeometry? contentPadding;

  const CustomTextfield({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.color,
    this.validator,
    this.labelText,
    this.hintText,
    this.isBorder = true,
    this.autofocus = false,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.hintTextStyle,
    this.maxLines = 1,
    this.maxLength,
    this.radius = 20,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.isDense = true,
    this.textStyle,
    this.textInputAction,
    this.expands = false,
    this.height,
    this.obscureText = false,
    this.trailing,
    this.ontap,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final TextInputAction? textInputAction;
  final bool obscureText;
  final GestureTapCallback? ontap;

  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoonFormTextInput(
          onTap: () {
            ontap!();
          },
          controller: controller,
          keyboardType: TextInputType.text,
          // enabled: !state.loading,
          hintText: hintText,
          hasFloatingLabel: true,
          textInputSize: MoonTextInputSize.xl,
          onChanged: (value) {
            onChanged!(value);
          },
        ),
      ],
    );
  }
}

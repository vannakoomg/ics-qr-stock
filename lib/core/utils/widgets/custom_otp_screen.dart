import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../constants/app_colors_constants.dart';

class CustomOtpScreen extends StatefulWidget {
  final ValueChanged<String> validator;
  final ValueChanged<String> onChanged;
  final Function ontapReSend;
  final String title;
  final bool errorState;
  const CustomOtpScreen({
    super.key,
    required this.validator,
    required this.title,
    required this.ontapReSend,
    this.errorState = false,
    required this.onChanged,
  });

  @override
  State<CustomOtpScreen> createState() => _CustomOtpScreenState();
}

class _CustomOtpScreenState extends State<CustomOtpScreen> {
  Timer? time;
  final controller = OtpController();
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (controller.time.value > 0) {
        controller.time.value = controller.time.value - 1;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Theme.of(context).textTheme.titleMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(255, 82, 81, 81)),
      ),
    );
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Gap(10),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge!,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        controller: otpController,
                        autofocus: true,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        validator: (value) {
                          widget.validator(value.toString());
                          return null;
                        },
                        onChanged: (value) {
                          widget.onChanged(value);
                        },
                        errorText: "Otp មិនត្រូវទេសូមព្យាយាមម្ដងទៀត",
                        forceErrorState: widget.errorState,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        isCursorAnimationEnabled: false,
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: AppColor.successColor,
                            ),
                          ],
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(
                              color: const Color.fromARGB(255, 225, 85, 85)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "មិនបានទទួល OTP? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.time.value == 0) {
                        widget.ontapReSend();
                        controller.time.value = 60;
                        setState(() {
                          otpController.text = '';
                        });
                      }
                    },
                    child: Text(
                      controller.time.value == 0
                          ? "ផ្ញើរម្ដងទៀត"
                          : "${controller.time.value} វិនាទី",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.secondnaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpController extends GetxController {
  final time = 60.obs;
}

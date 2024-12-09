import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:injectable/injectable.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/di/di.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import '../../../app/base/navigation/app_navigator.dart';
import 'app_popup_info.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appPopupInfo, IAppNavigator navigator);
}

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, IAppNavigator navigator) {
    return appPopupInfo.when(
      errorDialog: (
        message,
        onClose,
        onDismiss,
        title,
        titleClose,
        canDismiss,
      ) =>
          AlertDialog(
        title: const Text('Error'),
        titlePadding:
            const EdgeInsets.all(kPadding2).copyWith(bottom: kPadding / 2),
        contentPadding: const EdgeInsets.symmetric(horizontal: kPadding2),
        actionsPadding: const EdgeInsets.all(kPadding2),
        content: Text(message ?? ''),
        actions: [
          MoonButton(
            onTap: () {
              Navigator.pop(navigator.context);
            },
            label: const Text("Back"),
          )
        ],
      ),
      //     FailureDialog(
      //   title: title,
      //   message: message,
      //   onClose: onClose,
      //   onDismiss: onDismiss,
      //   titleClose: titleClose,
      //   canDismiss: canDismiss ?? true,
      //   navigator: navigator,
      // ),
      infoDialog: (
        message,
        onLeftAction,
        onRightAction,
        title,
        titleLeft,
        titleRight,
        canDismiss,
      ) =>
          const SizedBox(),

      //     InfoDialog(
      //   message: message,
      //   onLeftAction: onLeftAction,
      //   onRightAction: onRightAction,
      //   title: title,
      //   titleLeft: titleLeft,
      //   titleRight: titleRight,
      //   canDismiss: canDismiss ?? true,
      //   navigator: navigator,
      // ),
      confirmDialog: (message) {
        return const SizedBox.shrink();
        // return CommonDialog(
        //   actions: [
        //     PopupButton(
        //       text: S.current.ok,
        //       onPressed: onPressed ?? Func0(() => navigator.pop()),
        //     ),
        //   ],
        //   message: message,
        // );
      },
      errorWithRetryDialog: (message) {
        return const SizedBox.shrink();
        // return CommonDialog(
        //   actions: [
        //     PopupButton(
        //       text: S.current.cancel,
        //       onPressed: Func0(() => navigator.pop()),
        //     ),
        //     PopupButton(
        //       text: S.current.retry,
        //       onPressed: onRetryPressed ?? Func0(() => navigator.pop()),
        //       isDefault: true,
        //     ),
        //   ],
        //   message: message,
        // );
      },

      addNewQuestionModalBottomSheet: () => const Padding(
        padding: EdgeInsets.only(
          top: 0,
        ),
        child: Text(""),
      ),
      unAuthenticated: (String message, void Function() onPressedButton) =>
          Padding(
        padding: const EdgeInsets.all(kPadding2),
        child: MoonModal(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding2, vertical: kPadding2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('App take a little break!',
                    style: MoonTypography.typography.heading.text14),
                const Gap(kPadding),
                Text('We will be back very soon. Sorry for incovienence',
                    style: MoonTypography.typography.body.text12),
                const Gap(kPadding2),
                MoonFilledButton(
                  isFullWidth: true,
                  buttonSize: MoonButtonSize.md,
                  label: Text(t.common.ok),
                  onTap: () {
                    navigator.pop();
                    onPressedButton.call();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      customDialog: (Widget child) => child,
      modalLogin: () => const ModalLogin(),
      // ),
    );
  }
}

class ModalLogin extends StatelessWidget {
  const ModalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(kPadding2).copyWith(
          bottom: MediaQuery.viewInsetsOf(context).bottom + s3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.login.title,
              style: context.moonTypography?.heading.text14,
            ),
            const Gap(kPadding),
            MoonFormTextInput(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              hasFloatingLabel: true,
              textInputSize: MoonTextInputSize.lg,
              validator: (String? value) => value != null && value.length < 5
                  ? "The text should be longer than 5 characters."
                  : null,
              onChanged: (value) {},
              leading: const Icon(MoonIcons.mail_envelope_32_regular),
            ),
            const Gap(kPadding),
            MoonFormTextInput(
              hintText: 'Password',
              hasFloatingLabel: true,
              textInputSize: MoonTextInputSize.lg,
              keyboardType: TextInputType.visiblePassword,
              validator: (String? value) => value != null && value.length < 8
                  ? "The text should be longer than 5 characters."
                  : null,
              onChanged: (value) {},
              leading: const Icon(MoonIcons.security_key_32_regular),
              // obscureText: state.showPassword,
              // trailing: IconButton(
              //   visualDensity: VisualDensity.comfortable,
              //   onPressed: () {
              //   },
              //   icon: Icon(
              //     state.showPassword
              //         ? MoonIcons.controls_eye_32_regular
              //         : MoonIcons.controls_eye_crossed_32_regular,
              //   ),
              // ),
            ),
            const Gap(s3),
            MoonFilledButton(
              buttonSize: MoonButtonSize.md,
              isFullWidth: true,
              label: Text(t.login.title),
              onTap: () {
                getIt
                    .get<IAppNavigator>()
                    .replaceAll([const AppRouteInfo.login()]);
              },
            )
          ],
        ),
      ),
    );
  }
}

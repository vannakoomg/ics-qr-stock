import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/app/base/page/base_page_bloc_state.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/features/login/presentation/bloc/login_bloc.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageBlocState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.login.title),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MoonFormTextInput(
                        keyboardType: TextInputType.emailAddress,
                        enabled: !state.loading,
                        hintText: t.common.user,
                        hasFloatingLabel: true,
                        textInputSize: MoonTextInputSize.xl,
                        onChanged: (value) {
                          bloc.add(UserNameChange(value));
                        },
                        leading: const Icon(MoonIcons.generic_user_16_light),
                      ),
                      const Gap(kPadding),
                      MoonFormTextInput(
                        enabled: !state.loading,
                        hintText: t.common.password,
                        hasFloatingLabel: true,
                        textInputSize: MoonTextInputSize.xl,
                        onChanged: (value) {
                          bloc.add(PasswordChange(value));
                        },
                        leading: const Icon(MoonIcons.security_key_32_regular),
                        obscureText: state.showPassword,
                        helperPadding: EdgeInsets.zero,
                        trailing: IconButton(
                          visualDensity: VisualDensity.comfortable,
                          onPressed: () {
                            bloc.add(TogglePasswordVisibility());
                          },
                          icon: Icon(
                            !state.showPassword
                                ? MoonIcons.controls_eye_32_regular
                                : MoonIcons.controls_eye_crossed_32_regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MoonButton(
                  onTap: () {
                    bloc.add(ClickButtonLogin());
                  },
                  isFullWidth: true,
                  label: state.loading
                      ? const MoonCircularLoader(
                          sizeValue: 20,
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                        ),
                  backgroundColor: state.enableLogin
                      ? AppColor.primaryColor
                      : context.moonColors!.beerus,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

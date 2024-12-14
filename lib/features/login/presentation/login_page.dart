import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/app/base/page/base_page_bloc_state.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: context.moonColors!.beerus,
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: Text(
        //     t.login.title,
        //     style: context.moonTypography!.heading.text20,
        //   ),
        // ),
        body: SafeArea(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(kPadding2),
                child: Column(
                  children: [
                    Text(
                      t.login.title.toUpperCase(),
                      style: context.moonTypography!.heading.text32
                          .copyWith(color: AppColor.primaryColor),
                    ),
                    kPadding.gap,
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            t.login.des,
                          ),
                          kPadding2.gap,
                          MoonFormTextInput(
                            keyboardType: TextInputType.emailAddress,
                            enabled: !state.loading,
                            hintText: t.login.userName,
                            hasFloatingLabel: true,
                            textInputSize: MoonTextInputSize.xl,
                            onChanged: (value) {
                              bloc.add(UserNameChange(value));
                            },
                            leading:
                                const Icon(MoonIcons.generic_user_16_light),
                          ),
                          const Gap(kPadding),
                          MoonFormTextInput(
                            enabled: !state.loading,
                            hintText: t.login.password,
                            hasFloatingLabel: true,
                            textInputSize: MoonTextInputSize.xl,
                            onChanged: (value) {
                              bloc.add(PasswordChange(value));
                            },
                            leading:
                                const Icon(MoonIcons.security_key_32_regular),
                            obscureText: state.showPassword,
                            helperPadding: EdgeInsets.zero,
                            trailing: IconButton(
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
                          : Text(
                              t.login.title,
                              style: context.moonTypography!.heading.text16
                                  .copyWith(
                                      color: state.enableLogin
                                          ? Colors.white
                                          : context.moonColors!.trunks),
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
        ),
      ),
    );
  }
}

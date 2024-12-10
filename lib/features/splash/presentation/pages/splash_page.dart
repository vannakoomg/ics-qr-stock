import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import '../bloc/bloc.dart';
import '../../../../app/base/page/base_page_bloc_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageBlocState<SplashPage, SplashBloc> {
  String kkk = '';
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      appRoute.push(const AppRouteInfo.login());
    });
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kPadding2),
        child: Center(
          child: Text(
            " ${getRandomMessage()}",
            style: context.moonTypography!.body.text18,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

String getRandomMessage() {
  final List<String> messages = [
    t.splash.fun1,
    t.splash.fun2,
    t.splash.fun3,
    t.splash.fun4,
    t.splash.fun5
  ];
  Random random = Random();
  return messages[random.nextInt(messages.length)];
}

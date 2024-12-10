import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';

import '../bloc/bloc.dart';
import '../../../../app/base/page/base_page_bloc_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageBlocState<SplashPage, SplashBloc> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      appRoute.push(const AppRouteInfo.login());
    });
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(""),
      ),
    );
  }
}

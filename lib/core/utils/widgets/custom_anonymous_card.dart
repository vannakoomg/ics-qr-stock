import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/di/di.dart';

import '../../../app/base/navigation/app_navigator.dart';
import '../../../config/router/page_route/app_route_info.dart';
import '../../constants/constants.dart';
import '../../../gen/i18n/translations.g.dart';
import 'custom_buttom.dart';

class CustomAnonymousCard extends StatefulWidget {
  const CustomAnonymousCard({
    super.key,
  });

  @override
  State<CustomAnonymousCard> createState() => _CustomAnonymousCardState();
}

class _CustomAnonymousCardState extends State<CustomAnonymousCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          getIt.get<IAppNavigator>().pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            color: const Color.fromARGB(255, 32, 32, 32).withOpacity(0.2),
            child: Center(
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(kPadding2),
                  padding: const EdgeInsets.all(kPadding2),
                  decoration: BoxDecoration(
                      color: context.moonColors!.beerus,
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        t.anonymous.title,
                        style: context.moonTypography!.heading.text16,
                      ),
                      kPadding.gap,
                      Text(
                        t.anonymous.description,
                        style: context.moonTypography!.body.text14,
                      ),
                      kPadding2.gap,
                      CustomButtom(
                          title: t.anonymous.buttonName,
                          onTap: () {
                            getIt
                                .get<IAppNavigator>()
                                .replaceAll([const AppRouteInfo.login()]);
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void name() {}

enum ClickAnonymousType { close, leaveAnonymous }

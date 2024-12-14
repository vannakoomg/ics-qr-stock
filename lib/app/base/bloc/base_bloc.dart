import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/app/app_bloc/app_bloc.dart';
import 'package:sos_mobile/app/base/bloc/base_event.dart';

import '../../../config/router/popup_route/app_popup_info.dart';
import '../navigation/app_navigator.dart';
import 'base_state.dart';

//  Bloc<LoginEvent, LoginState>
abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends BaseBlocDeligate<E, S> {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDeligate<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBlocDeligate(super.initialState);

  late final IAppNavigator appRoute;
  late final AppBloc appBloc;

  FutureOr<void> runAppCatching(
    Future<void> Function() action, {
    Future<void> Function(Object error)? onError,
  }) async {
    try {
      await action.call();
    } catch (e) {
      await onError?.call(e);
      addException(e);
      if (e is DioException) {
        debugPrint('is DIO Error => ${e.response?.data}');
      }
    }
  }

  void addException(Object error) {
    if (error is DioException) {
      appRoute.showGeneralDialog(
        AppPopupInfo.errorDialog(
          title: 'Somethings went wrong!',
          message: error.response?.data['message'],
        ),
      );
      return;
    }

    appRoute.showDialog(
      AppPopupInfo.unAuthenticated(
        message: error.toString(),
        onPressedButton: () {
          // appRoute.replaceAll([const AppRouteInfo.login()]);
        },
      ),
    );
  }
}

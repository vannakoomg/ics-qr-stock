import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/app/base/bloc/base_bloc.dart';
import 'package:sos_mobile/app/base/bloc/base_event.dart';
import 'package:sos_mobile/app/base/bloc/base_state.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
import 'package:sos_mobile/config/router/popup_route/app_popup_info.dart';
import 'package:sos_mobile/config/exceptions/app_exception.dart';
import 'package:sos_mobile/core/utils/log/app_logger.dart';

import '../../core/constants/constants.dart';
import '../../core/helper/local_data/storge_local.dart';

part 'app_event.dart';
part 'app_state.dart';

part 'app_bloc.freezed.dart';

@Injectable()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(const _Initial()) {
    on<AppEvent>((event, emit) async {
      await event.map(
          started: (value) {},
          onCachedError: (onCachedError) async {
            debugPrint("---------------->$onCachedError");
            await _onCachedError(onCachedError, emit);
          });
    });
  }

  FutureOr<void> _onCachedError(
      _OnCachedError onCachedError, Emitter<AppState> emit) async {
    emit(state.copyWith(error: null));
    final error = onCachedError.error;

    emit(state.copyWith(error: error));
    debugPrint("khmer s khdsfjksd");
    if (error is DioException) {
      logE(stackTrace: error.stackTrace);
      if (error.response?.data['message'] == 'Unauthenticated.') {
        appRoute.showDialog(
          AppPopupInfo.unAuthenticated(
            message: error.response?.data['message'],
            onPressedButton: () {
              LocalStorage.remove(SharedPreferenceKeys.accessToken);
              appRoute.replaceAll([const AppRouteInfo.login()]);
            },
          ),
        );
        return;
      }

      final type = error.type;

      switch (type) {
        case DioExceptionType.connectionTimeout:
          appRoute.showDialog(
            const AppPopupInfo.errorDialog(
              title: 'Time Out',
              message: 'Connection Timeout',
            ),
          );
          break;
        case DioExceptionType.sendTimeout:
          appRoute.showDialog(
            const AppPopupInfo.errorDialog(
              title: 'Time Out',
              message: 'Sent Timeout',
            ),
          );
          break;
        case DioExceptionType.receiveTimeout:
          appRoute.showDialog(
            const AppPopupInfo.errorDialog(
              title: 'Time Out',
              message: 'Receive Timeout',
            ),
          );
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          appRoute.showDialog(
            const AppPopupInfo.errorDialog(
              message: 'Connection Error',
            ),
          );
          break;
        case DioExceptionType.unknown:
          appRoute.showDialog(
            const AppPopupInfo.errorDialog(
              title: 'Unknown Error',
              message: 'Something went wrong!',
            ),
          );
          break;
      }
    }

    if (error is AppException) {
      final AppExceptionType appExceptionType = error.exceptionType;
      switch (appExceptionType) {
        case AppExceptionType.service:
          appRoute
              .showDialog(AppPopupInfo.errorDialog(message: error.toString()));
          break;
        default:
      }
    }
  }
}

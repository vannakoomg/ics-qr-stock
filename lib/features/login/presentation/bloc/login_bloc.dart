// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:sos_mobile/app/base/bloc/base_bloc.dart';
import 'package:sos_mobile/app/base/bloc/base_event.dart';
import 'package:sos_mobile/app/base/bloc/base_state.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
import 'package:sos_mobile/features/login/domain/entity/login_entity.dart';
import 'package:sos_mobile/features/login/domain/usecase/login_usecase.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/helper/fuction.dart';
import '../../../../core/helper/local_data/storge_local.dart';
import '../../data/data_sources/remote/login_api_service.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<UserNameChange>(_onUserNameChnage);
    on<PasswordChange>(_onPasswordChanged);
    on<ClickButtonLogin>(_onClickedButtonLogin);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  FutureOr<void> _togglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  FutureOr<void> _onUserNameChnage(
      UserNameChange event, Emitter<LoginState> emit) async {
    emit(state.copyWith(userName: event.value));
    _enableLogin(emit);
    return;
  }

  FutureOr<void> _onPasswordChanged(
      PasswordChange event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.value));
    _enableLogin(emit);
  }

  FutureOr<void> _onClickedButtonLogin(
      ClickButtonLogin event, Emitter<LoginState> emit) async {
    await runAppCatching(
      () async {
        emit(state.copyWith(loading: true));
        unFocus();
        final input =
            LoginInput(username: state.userName, password: state.password);
        List<LoginResponseEntity> loginEnity =
            await _loginUseCase.excecute(input);
        await LocalStorage.storeData(
          key: SharedPreferenceKeys.accessToken,
          value: loginEnity[0].token,
        );
        await LocalStorage.storeData(
          key: SharedPreferenceKeys.userId,
          value: loginEnity[0].userId,
        );
        emit(state.copyWith(loading: false));

        appRoute.push(const AppRouteInfo.scanStock());
      },
      onError: (e) async {
        emit(state.copyWith(loading: false));
        print('Error Login $e');
      },
    );
  }

  // this for check condition to enable button login base on lartest state value
  void _enableLogin(Emitter<LoginState> emit) {
    debugPrint("${state.userName.isNotEmpty && state.password.length >= 8}");
    if (state.userName.isNotEmpty && state.password.isNotEmpty) {
      emit(state.copyWith(enableLogin: true));
    } else {
      emit(state.copyWith(enableLogin: false));
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/app/base/bloc/base_bloc.dart';
import 'package:sos_mobile/app/base/bloc/base_event.dart';
import 'package:sos_mobile/app/base/bloc/base_state.dart';

part 'remark_event.dart';
part 'remark_state.dart';
part 'remark_bloc.freezed.dart';

@Injectable()
class RemarkBloc extends BaseBloc<RemarkEvent, RemarkState> {
  RemarkBloc() : super(const _Initial()) {
    on<InitPage>(_initPage);
    on<RemarkChanged>(_remarkChanged);
  }
  FutureOr<void> _initPage(InitPage event, Emitter<RemarkState> emit) {
    emit(state.copyWith(
        oldRemark: event.value,
        remark: event.value,
        remarkController: TextEditingController(text: event.value)));
  }

  FutureOr<void> _remarkChanged(
      RemarkChanged event, Emitter<RemarkState> emit) {
    emit(state.copyWith(remark: event.value));
  }
}

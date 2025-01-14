import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
import 'package:sos_mobile/core/helper/fuction.dart';
import 'package:sos_mobile/data/data_sources/remotes/scan_stock_api_service.dart';
import 'package:sos_mobile/features/scan_stock/domain/entities/asset_entity.dart';
import 'package:sos_mobile/features/scan_stock/domain/usecase/get_asset_detail_usecase.dart';
import 'package:sos_mobile/features/scan_stock/domain/usecase/remark_asset_usecase.dart';
import '../../../../app/base/bloc/bloc.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/local_data/storge_local.dart';
import '../../../../di/di.dart';
import '../../../../gen/i18n/translations.g.dart';

part 'scan_stock_event.dart';
part 'scan_stock_state.dart';
part 'scan_stock_bloc.freezed.dart';

@Injectable()
class ScanStockBloc extends BaseBloc<ScanStockEvent, ScanStockState> {
  final GetAssetDetailUsecase _getAssetDetailUsecase;
  final RemarkAssetUsecase _remarkAssetUsecase;
  ScanStockBloc(this._getAssetDetailUsecase, this._remarkAssetUsecase)
      : super(const _Initial()) {
    on<ClickChangeMode>(_onChangeMode);
    on<ClickChangeLanguage>(_onChnageLanduage);
    on<ClickLogout>(_onClickLogout);
    on<GetAssets>(_getAsset);
    on<ClickConfrim>(_clickConfirm);
    on<RemarkChangedEvent>(_remarkChanged);
    on<ClickCampus>(_onClickCampus);
    on<ClickOutSide>(_onClickOutside);
    on<ClickSelectCampus>(_onClickSelectCampus);
    on<RoomChanged>(_onroomChanged);
    on<DescEnChanged>(_onDescEnChanged);
    on<DescKhChanged>(_onDescKhChanged);
    on<ClickQuality>(_onClickQuslity);
    on<ClickSelectQuality>(_onClickSelectQuality);
    on<TabTextfile>(_onTabTextfile);
  }
  FutureOr<void> _getAsset(
      GetAssets event, Emitter<ScanStockState> emit) async {
    await runAppCatching(
      () async {
        emit(state.copyWith(
            isLoading: true,
            asset: null,
            isAssetNull: false,
            assetId: event.id));
        appRoute.pop();
        List<AssetEntity> ass = await _getAssetDetailUsecase
            .excecute(AssetInput(assetNumber: event.id));
        if (ass.isEmpty) {
          emit(state.copyWith(
            isLoading: false,
            isAssetNull: true,
          ));
        } else {
          emit(state.copyWith(
              isLoading: false,
              asset: ass[0],
              isAssetNull: false,
              remark: ass[0].remark.trimRight(),
              remarkController:
                  TextEditingController(text: ass[0].remark.trimRight())));
        }
      },
      onError: (error) async {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  FutureOr<void> _onChangeMode(
      ClickChangeMode event, Emitter<ScanStockState> emit) {
    getIt.get<ThemeController>().toggleThemeChange();
  }

  FutureOr<void> _remarkChanged(
      RemarkChangedEvent event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(remark: event.remark));
  }

  FutureOr<void> _clickConfirm(
      ClickConfrim event, Emitter<ScanStockState> emit) async {
    await runAppCatching(
      () async {
        unFocus();
        debugPrint("-------------------------------------------");
        emit(state.copyWith(isLoadingRemark: true));
        await _remarkAssetUsecase.excecute(VerifyInpust(
          updated_by: LocalStorage.getIntValue(SharedPreferenceKeys.userId),
          remark: event.remark == "" ? " " : event.remark,
          assetId: state.assetId,
          isVerify: event.isVerify,
          updateAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          campus: state.asset!.campus,
          room: state.asset!.room,
          description_in_khmer: state.asset!.description_in_khmer,
          name: state.asset!.name,
          quality: state.asset!.quality,
        ));
        emit(state.copyWith(
            isLoadingRemark: false,
            asset: state.asset!.copyWith(
              count_status: event.isVerify,
              remark: event.remark,
            )));
      },
    );
  }

  FutureOr<void> _onChnageLanduage(
      ClickChangeLanguage event, Emitter<ScanStockState> emit) {
    final applocal = LocaleSettings.instance.currentLocale;
    if (applocal == AppLocale.en) {
      LocaleSettings.instance.setLocale(AppLocale.km);
      LocalStorage.storeData(key: SharedPreferenceKeys.languages, value: "km");
    } else {
      LocaleSettings.instance.setLocale(AppLocale.en);
      LocalStorage.storeData(key: SharedPreferenceKeys.languages, value: "en");
    }
  }

  FutureOr<void> _onClickLogout(
      ClickLogout event, Emitter<ScanStockState> emit) {
    LocalStorage.storeData(key: SharedPreferenceKeys.accessToken, value: "");
    appRoute.replaceAll([const AppRouteInfo.login()]);
  }

  FutureOr<void> _onClickCampus(
      ClickCampus event, Emitter<ScanStockState> emit) {
    unFocus();
    emit(state.copyWith(isShowCampus: !state.isShowCampus));
  }

  FutureOr<void> _onClickQuslity(
      ClickQuality event, Emitter<ScanStockState> emit) {
    unFocus();
    emit(state.copyWith(isShowQuality: !state.isShowQuality));
  }

  FutureOr<void> _onClickOutside(
      ClickOutSide event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
        isShowCampus: false, isShowQuality: false, isTabTextfile: false));
  }

  FutureOr<void> _onClickSelectCampus(
      ClickSelectCampus event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
        asset: state.asset!.copyWith(campus: event.campus),
        isShowCampus: false));
  }

  FutureOr<void> _onClickSelectQuality(
      ClickSelectQuality event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
        asset: state.asset!.copyWith(quality: event.quality),
        isShowQuality: false));
  }

  FutureOr<void> _onDescKhChanged(
      DescKhChanged event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
      asset: state.asset!.copyWith(description_in_khmer: event.value),
    ));
  }

  FutureOr<void> _onDescEnChanged(
      DescEnChanged event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
      asset: state.asset!.copyWith(name: event.value),
    ));
  }

  FutureOr<void> _onroomChanged(
      RoomChanged event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(
      asset: state.asset!.copyWith(room: event.value),
    ));
  }

  FutureOr<void> _onTabTextfile(
      TabTextfile event, Emitter<ScanStockState> emit) {
    emit(state.copyWith(isTabTextfile: true));
  }
}

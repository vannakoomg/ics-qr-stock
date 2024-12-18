import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sos_mobile/config/router/page_route/app_route_info.dart';
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
    on<RemarkAsset>(_remarkAsset);
  }
  FutureOr<void> _getAsset(
      GetAssets event, Emitter<ScanStockState> emit) async {
    await runAppCatching(
      () async {
        emit(state.copyWith(isLoading: true, asset: null, isAssetNull: false));
        List<AssetEntity> ass = await _getAssetDetailUsecase
            .excecute(AssetInput(assetNumber: "2-CIS-201-001-002"));
        if (ass.isEmpty) {
          emit(state.copyWith(isLoading: false, isAssetNull: true));
        } else {
          emit(state.copyWith(
              isLoading: false, asset: ass[0], isAssetNull: false));
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

  FutureOr<void> _remarkAsset(
      RemarkAsset event, Emitter<ScanStockState> emit) async {
    await runAppCatching(
      () async {
        await _remarkAssetUsecase.excecute(RemarkInput(
            remark: event.remark == "" ? " " : event.remark,
            assetId: "2-CIS-201-001-002",
            updateAt:
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())));
        emit(state.copyWith(
            asset:
                state.asset!.copyWith(isRemark: true, remark: event.remark)));
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
}

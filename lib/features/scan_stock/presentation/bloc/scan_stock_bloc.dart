import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
  ScanStockBloc() : super(const _Initial()) {
    on<ClickChangeMode>(_onChangeMode);
    on<ClickChangeLanguage>(_onChnageLanduage);
  }
  FutureOr<void> _onChangeMode(
      ClickChangeMode event, Emitter<ScanStockState> emit) {
    getIt.get<ThemeController>().toggleThemeChange();
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
}

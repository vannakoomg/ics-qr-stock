part of 'scan_stock_bloc.dart';

class ScanStockEvent extends BaseEvent {}

@freezed
class ClickChangeLanguage extends ScanStockEvent with _$ClickChangeLanguage {
  factory ClickChangeLanguage() = _ClickChangeLanguage;
}

@freezed
class ClickChangeMode extends ScanStockEvent with _$ClickChangeMode {
  factory ClickChangeMode() = _ClickChangeMode;
}

@freezed
class GetAssets extends ScanStockEvent with _$GetAssets {
  factory GetAssets(String id) = _GetAssets;
}

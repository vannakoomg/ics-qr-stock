part of 'scan_stock_bloc.dart';

@freezed
class ScanStockState extends BaseState with _$ScanStockState {
  const factory ScanStockState.initial({
    AssetEntity? asset,
    @Default(false) bool isLoading,
    @Default(false) bool isAssetNull,
  }) = _Initial;
}

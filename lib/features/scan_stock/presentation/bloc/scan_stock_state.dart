part of 'scan_stock_bloc.dart';

@freezed
class ScanStockState extends BaseState with _$ScanStockState {
  const factory ScanStockState.initial(
      {AssetEntity? asset,
      @Default(false) bool isLoading,
      @Default(false) bool isLoadingRemark,
      @Default(false) bool isAssetNull,
      @Default('') String assetId,
      @Default('') String remark,
      TextEditingController? remarkController,
      TextEditingController? descKhController,
      TextEditingController? descEnController,
      TextEditingController? roomController,
      @Default(false) bool isShowCampus,
      @Default(false) bool isTabTextfile,
      @Default(false) bool isShowQuality}) = _Initial;
}

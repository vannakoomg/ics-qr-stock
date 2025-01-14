import 'package:injectable/injectable.dart';
import 'package:sos_mobile/data/data_sources/remotes/scan_stock_api_service.dart';
import 'package:sos_mobile/data/models/scan_stock/asset_model.dart';
import 'package:sos_mobile/features/scan_stock/domain/entities/asset_entity.dart';

import '../../features/scan_stock/domain/repository/scan_stock_repository.dart';

@LazySingleton(as: ScanStockRepository)
class ScanStockRepositoryImpl implements ScanStockRepository {
  final ScanStockApiService _apiService;
  ScanStockRepositoryImpl(this._apiService);

  @override
  Future<List<AssetEntity>> getAssetDetail(AssetInput input) async {
    final data = await _apiService.getAssetDetail(assetInput: input);
    return data.data.toListEntity();
  }

  @override
  Future<void> remarkAsset(VerifyInpust remark) async {
    return await _apiService.remarkAsset(VerifyInpust: remark);
  }
}

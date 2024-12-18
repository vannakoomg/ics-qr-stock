import 'package:sos_mobile/data/data_sources/remotes/scan_stock_api_service.dart';
import 'package:sos_mobile/features/scan_stock/domain/entities/asset_entity.dart';

abstract class ScanStockRepository {
  Future<List<AssetEntity>> getAssetDetail(AssetInput input);
  Future<void> remarkAsset(RemarkInput remark);
}

import 'package:injectable/injectable.dart';
import 'package:sos_mobile/app/base/usecase/base_use_case.dart';
import 'package:sos_mobile/data/data_sources/remotes/scan_stock_api_service.dart';
import 'package:sos_mobile/features/scan_stock/domain/entities/asset_entity.dart';
import 'package:sos_mobile/features/scan_stock/domain/repository/scan_stock_repository.dart';

@Injectable()
class GetAssetDetailUsecase extends BaseUseCase<AssetInput, List<AssetEntity>> {
  final ScanStockRepository _repository;
  GetAssetDetailUsecase(this._repository);
  @override
  Future<List<AssetEntity>> excecute(AssetInput input) async {
    return _repository.getAssetDetail(input);
  }
}
